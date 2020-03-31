//
//  QuidditchPlayersListScreen.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 3/25/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import UIKit
import Kingfisher

class QuidditchPlayersListScreen: UIViewController {
    
    @IBOutlet weak var playerTableView: UITableView!
    
    var quidditchPlayers: [Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiCompleted: ([Player]) -> Void = { (players) in

            self.quidditchPlayers = players
            self.playerTableView.delegate = self
            self.playerTableView.dataSource = self
            self.playerTableView.reloadData()
        }
        makeApiCall(apiCompleted: apiCompleted)
    }
    
    func makeApiCall(apiCompleted: @escaping ([Player]) -> ()) {
        
        if let url = URL(string: "https://cjmobileapps.com/api/v1/quidditch/players") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let players = try JSONDecoder().decode([Player].self, from: data)

                        DispatchQueue.main.async {
                            apiCompleted(players)
                        }
                        
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }   
}

extension QuidditchPlayersListScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quidditchPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = quidditchPlayers[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuidditchPlayerCell") as! QuidditchPlayerCell
        
        cell.setPlayer(player: player)
        
        return cell
    }
}
