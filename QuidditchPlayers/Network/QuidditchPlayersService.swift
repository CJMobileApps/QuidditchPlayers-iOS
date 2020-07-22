//
//  QuidditchPlayersService.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 4/2/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class QuidditchPlayersService {

    let tag = String(describing: QuidditchPlayersService.self)

    let afSession = Session(eventMonitors: [HttpLogger()])

    func fetchPlayers() -> Single<[Player]> {
        Single<[Player]>.create { single in

            let request = self.afSession.request(PlayersRouter.players).responseData { response in

                do {
                    switch response.result {
                    case .success(let json):
                        let responseWrapper = try JSONDecoder().decode(ResponseWrapper<[Player]>.self, from: json)
                        let players: [Player] = responseWrapper.data
                        single(.success(players))
                    case .failure(let error):
                        single(.error(error))
                    }
                } catch {

                }
            }

            return Disposables.create {
                request.cancel()
            }
        }
    }

    func fetchPositions() -> Single<[Int: String]> {
        Single<[Int: String]>.create { single in

            let request = self.afSession.request(PlayersRouter.positions).responseData { response in

                do {
                    switch response.result {
                    case .success(let json):
                        do {
                            let responseWrapper = try JSONDecoder().decode(ResponseWrapper<[Int: String]>.self, from: json)
                            let positions: [Int: String] = responseWrapper.data
                            single(.success(positions))
                        } catch let error {
                            print("\(self.tag): error \(error)")
                            print("\(self.tag): possibly something wrong with JSON or a bad url. Test with responseString instead of responseData")
                        }
                    case .failure(let error):
                        single(.error(error))
                    }
                }
            }

            return Disposables.create {
                request.cancel()
            }
        }
    }

    func getStatuses() -> Observable<Status> {
        Observable<Status>.create { emitter in
            let onStatus: (Status) -> Void = { (status) in
                emitter.onNext(status)
            }

            // TODO: dependency injection
            let webSocketRepository = WebSocketRepository()
            webSocketRepository.connectToStatuses(onStatus: onStatus)

            return Disposables.create {
                webSocketRepository.disconnectFromStatuses()
            }
        }
    }
}
