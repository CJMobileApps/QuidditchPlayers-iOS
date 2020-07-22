//
// Created by Chris Jones on 7/21/20.
// Copyright (c) 2020 cjmobileapps. All rights reserved.
//

import Foundation

struct ResponseWrapper<T: Decodable>: Decodable {
    let data: T
    let error: Error?
    let statusCode: Int
}

struct Error : Decodable {
    let isError: Bool = false
    let message: String?
}
