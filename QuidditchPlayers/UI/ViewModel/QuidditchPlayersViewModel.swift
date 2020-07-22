//
//  QuidditchPlayersViewModel.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 4/2/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import Foundation
import RxSwift

class QuidditchPlayersViewModel {

    let tag = String(describing: QuidditchPlayersViewModel.self)

    let compositeDisposable = CompositeDisposable()
    let quidditchPlayersService: QuidditchPlayersService
    var playersIndexDict = [String: Int]()

    var players: Observable<[Player]> {
        self.playersSubject.asObservable()
    }

    var status: Observable<Status> {
        self.statusesSubject.asObservable()
    }

    private var playersSubject = PublishSubject<[Player]>()
    private var statusesSubject = PublishSubject<Status>()

    init(quidditchPlayersService: QuidditchPlayersService) {
        self.quidditchPlayersService = quidditchPlayersService
    }

    func fetchPlayers() {
        compositeDisposable.insert(getPlayersAndPositions(playersObservable: getPlayersObservable(), positionsObservable: getPositionsObservable()))
        compositeDisposable.insert(getStatuses())
    }

    func getPlayersObservable() -> Observable<[Player]> {
        quidditchPlayersService.fetchPlayers().asObservable().subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }

    func getPositionsObservable() -> Observable<[Int: String]> {
        quidditchPlayersService.fetchPositions().asObservable()
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }

    private func getPlayersAndPositions(
            playersObservable: Observable<[Player]>,
            positionsObservable: Observable<[Int: String]>
    ) -> Disposable {
        Observable.zip(playersObservable, positionsObservable) { (players: [Player], positions: [Int: String]) in
            var players = players

            for (index, player) in players.enumerated() {
                players[index].positionName = positions[player.position]
                players[index].status = "No Status"
                self.playersIndexDict[player.id] = index
            }
            return players

        }.observeOn(MainScheduler.instance).subscribe(onNext: { (players: [Player]) in
            self.playersSubject.onNext(players)
        }, onError: { error in
            print("\(self.tag): error ViewModel \(error)")
        }, onCompleted: {
            //
        }) {
            //
        }
    }

    private func getStatuses() -> Disposable {
        quidditchPlayersService.getStatuses()
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { (status: Status) in
                    self.statusesSubject.onNext(status)
                }, onError: { error in
                    print("\(self.tag): error ViewModel \(error)")
                }, onCompleted: {
                    //
                }) {
                    //
                }
    }
}
