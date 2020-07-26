//
//  NetworkConstants.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 4/4/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import Foundation

struct NetworkConstants {
    struct ProductionServer {
        static let baseURL = "https://cjmobileapps.com/"
        static let quidditchTokenKey = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJqdGkiOiI1ZjliODUxYy00N2M2LTQ3MTUtYjRjNC04N2RiYWExOTc0MTIiLCJzdWIiOiJxdWlkZGl0Y2hBZG1pbjEiLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoicXVpZGRpdGNoOnJlYWQifSx7ImF1dGhvcml0eSI6InF1aWRkaXRjaDp3cml0ZSJ9LHsiYXV0aG9yaXR5IjoiUk9MRV9RVUlERElUQ0hfVVNFUiJ9XSwiaWF0IjoxNTk1Njc3MzI2LCJleHAiOjE1OTY4ODY5MjZ9.5HZ3Q_e-jLAoifclN5mnrR6fArvpgyJWRHBOrtx_4qFmXrwhcEu_nZqRP_3MVRJ6zSUxvCWnlSTbxQtWoVtoRw"
    }
}

enum HTTPHeaderField: String {
    case authorization = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
