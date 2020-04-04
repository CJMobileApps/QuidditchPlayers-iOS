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
    
    func fetchPlayers() -> Single<[Player]> {        
        return Single<[Player]>.create { single in
            
            let request = AF.request("https://cjmobileapps.com/api/v1/quidditch/players").responseDecodable(of: [Player].self) { response in
                
                switch response.result {
                case .success(let players):
                    single(.success(players))
                case .failure(let error):
                    single(.error(error))
                }
            }
            
            return Disposables.create { request.cancel() }
        }
    }
    
    func fetchPositions() -> Single<[Position]> {
        return Single<[Position]>.create { single in
            
            let request = AF.request("https://cjmobileapps.com/api/v1/quidditch/positions").responseDecodable(of: [Position].self) { response in
                
                switch response.result {
                case .success(let position):
                    single(.success(position))
                case .failure(let error):
                    single(.error(error))
                }
            }
            
            return Disposables.create { request.cancel() }
        }
    }
}
