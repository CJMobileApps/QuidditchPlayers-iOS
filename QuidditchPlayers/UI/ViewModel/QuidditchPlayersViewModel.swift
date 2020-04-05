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
    
    let compositeDisposable = CompositeDisposable()
    let quidditchPlayersService: QuidditchPlayersService
    var playersIndexDict = [Int:Int]()
    
    var players: Observable<[Player]> {
        return self.playersSubject.asObservable()
    }
    
    var status: Observable<Status> {
        return self.statusesSubject.asObservable()
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
    
    func getPlayersObservable() -> Observable<[Player]> {          quidditchPlayersService.fetchPlayers().asObservable().subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
    
    func getPositionsObservable() -> Observable<[Position]> {
        quidditchPlayersService.fetchPositions().asObservable()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
    }
    
    private func getPlayersAndPositions(
        playersObservable: Observable<[Player]>,
        positionsObservable: Observable<[Position]>
    ) -> Disposable {
        Observable.zip(playersObservable, positionsObservable) { (players, positions) in
            var players = players
            var positionsDict = [Int:String]()
            
            positions.forEach{ position in
                positionsDict[position.id] = position.positionName
            }
            
            for (index, player) in players.enumerated() {
                players[index].positionName = positionsDict[player.position]
                players[index].status = "No Status"
                self.playersIndexDict[player.id] = index
            }
            
            return players
        }
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { (players: [Player]) in
            self.playersSubject.onNext(players)
        }, onError: { (error: Error) in
            print("HERE_","error viewmodel \(error)")
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
            }, onError: { (error: Error) in
                print("HERE_","error viewmodel \(error)")
            }, onCompleted: {
                //
            }) {
                //
        }
    }
}
