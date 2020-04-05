//
//   WebSocketRepository.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 4/4/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import Foundation

class WebSocketRepository: NSObject {
    
    var webSocketTask: URLSessionWebSocketTask? = nil
        
    func connectToStatuses(onStatus: @escaping (Status) -> ()) {
        if(webSocketTask == nil) {
            let urlSession = URLSession(configuration: .default)
            webSocketTask = urlSession.webSocketTask(with: URL(string: "wss://cjmobileapps.com/api/v1/quidditch/status")!)
            webSocketTask?.resume()
            
            receiveMessage(onStatus: onStatus)
        }
    }
    
    func receiveMessage(onStatus: @escaping (Status) -> ()) {
        webSocketTask?.receive { result in
            switch result {
            case .failure(let error):
                print("HERE_","Error in receiving message: \(error)")
            case .success(let message):
                switch message {
                case .string(let jsonString):
                                        
                    do {
                        let jsonData = Data(jsonString.utf8)

                        let status = try JSONDecoder().decode(Status.self, from: jsonData)
                        onStatus(status)
                    } catch {
                        print(error.localizedDescription)
                    }
                case .data(let data):
                    print("HERE_","Received data: \(data)")
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
        print("HERE_","Connected!")
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("HERE_","Disconnected!")
    }
}
