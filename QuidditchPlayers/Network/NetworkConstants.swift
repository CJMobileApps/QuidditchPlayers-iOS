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
        static let quidditchTokenKey = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJqdGkiOiJkY2E5MzU0Yi1mZWNlLTRlMTItODJmOS0xOTcwZWFjZTNhZDUiLCJzdWIiOiJxdWlkZGl0Y2hBZG1pbjEiLCJhdXRob3JpdGllcyI6W3siYXV0aG9yaXR5IjoicXVpZGRpdGNoOnJlYWQifSx7ImF1dGhvcml0eSI6InF1aWRkaXRjaDp3cml0ZSJ9LHsiYXV0aG9yaXR5IjoiUk9MRV9RVUlERElUQ0hfVVNFUiJ9XSwiaWF0IjoxNTk1MDkzNTA5LCJleHAiOjE1OTYzMDMxMDl9.OeRhi7MdRo_HM2IbyvMbm6pPz1afvk1SFCUUgk0g5OkRgtUwNGFprQQKrFoPo6S510bIQBHtro9LUBXqjz5Sfw"
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
