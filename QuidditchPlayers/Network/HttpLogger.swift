//
// Created by Chris Jones on 7/18/20.
// Copyright (c) 2020 cjmobileapps. All rights reserved.
//

import Foundation
import Alamofire

final class HttpLogger: EventMonitor {

    let tag = String(describing: HttpLogger.self)

    // Event called when any type of Request is resumed.
    func requestDidResume(_ request: Request) {

        guard let request = request.request else {
            return
        }

        print("\(tag): \(request)")
        request.headers.forEach { header in
            print("\(tag): \(header)")
        }

        if let httpBody = request.httpBody {
            print("\(tag): \(httpBody)")
            return
        }
    }

    // Event called whenever a DataRequest has parsed a response.
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {

        let status = response.response?.statusCode ?? 400

        guard let data = response.data else {
            return
        }

        guard let responseUrl = response.response?.url else {
            return
        }

        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
            return
        }

        //todo if 400 or 500 print in red
        print("\(tag): \(status) \(responseUrl)")
        if (status > 300) {
            print("\(tag): \(json)") //todo add red failure logger
        } else {
            print("\(tag): \(json)")
        }
    }
}
