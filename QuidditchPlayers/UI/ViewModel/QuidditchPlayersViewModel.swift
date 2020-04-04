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
    
    var players: Observable<[Player]> {
        return self.playersVariable.asObservable()
    }
    
    private var playersVariable = PublishSubject<[Player]>()
    
    init(quidditchPlayersService: QuidditchPlayersService) {
        self.quidditchPlayersService = quidditchPlayersService
    }
    
    func fetchPlayers() {
        compositeDisposable.insert(getPlayersAndPositions(playersObservable: getPlayersObservable(), positionsObservable: getPositionsObservable()))
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
            }
            
            return players
        }
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { (players: [Player]) in
            self.playersVariable.onNext(players)
        }, onError: { (error: Error) in
            print("HERE_","error viewmodel \(error)")
        }, onCompleted: {
            //
        }) {
            //
        }
    }
}
