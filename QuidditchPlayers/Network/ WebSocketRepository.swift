//
//   WebSocketRepository.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 4/4/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import Foundation

class WebSocketRepository: NSObject {

    let tag = String(describing: WebSocketRepository.self)

    var webSocketTask: URLSessionWebSocketTask? = nil

    func connectToStatuses(onStatus: @escaping (Status) -> ()) {
        if (webSocketTask == nil) {
            let urlSession = URLSession(configuration: .default)
            webSocketTask = urlSession.webSocketTask(with: URL(string: "wss://cjmobileapps.com/api/v2/quidditch/status")!)
            webSocketTask?.resume()

            receiveMessage(onStatus: onStatus)
        }
    }

    func receiveMessage(onStatus: @escaping (Status) -> ()) {
        webSocketTask?.receive { result in
            switch result {
            case .failure(let error):
                print("\(self.tag): Error in receiving message: \(error)")
            case .success(let message):
                switch message {
                case .string(let jsonString):

                    do {
                        let jsonData = Data(jsonString.utf8)

                        let responseWrapper = try JSONDecoder().decode(ResponseWrapper<Status>.self, from: jsonData)
                        onStatus(responseWrapper.data)
                    } catch {
                        print("\(self.tag): error \(error.localizedDescription)")
                    }
                case .data(let data):
                    print("\(self.tag): Received data: \(data)")
                @unknown default:
                    print("\(self.tag): unknown error for web socket")
                }

                self.receiveMessage(onStatus: onStatus)
            }
        }
    }

    func disconnectFromStatuses() -> Bool {
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        return true
    }
}

extension WebSocketRepository: URLSessionWebSocketDelegate {
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("\(tag): Connected!")
    }

    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("\(tag): Disconnected!")
    }
}
