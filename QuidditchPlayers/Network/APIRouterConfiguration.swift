//
//  APIRouterConfiguration.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 4/4/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import Foundation
import Alamofire

protocol APIRouterConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
