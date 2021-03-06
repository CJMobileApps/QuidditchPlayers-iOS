//
//  PlayersRouter.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 4/4/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import Foundation
import Alamofire

enum PlayersRouter: APIRouterConfiguration {

    case players
    case positions

    var method: HTTPMethod {
        switch self {
        case .players:
            return .get
        case .positions:
            return .get
        }
    }

    var path: String {
        switch self {
        case .players:
            return "api/v2/quidditch/player"
        case .positions:
            return "api/v2/quidditch/position"
        }
    }

    var parameters: Parameters? {
        switch self {
        case .players:
            return nil
        case .positions:
            return nil
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try NetworkConstants.ProductionServer.baseURL.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        // Auth Headers
        urlRequest.setValue(NetworkConstants.ProductionServer.quidditchTokenKey, forHTTPHeaderField: HTTPHeaderField.authorization.rawValue)

        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        let encoding = JSONEncoding.default

        return try encoding.encode(urlRequest, with: parameters)
    }
}
