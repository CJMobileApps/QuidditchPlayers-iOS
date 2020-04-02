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
        
        let fetchPlayersCompleted: ([Player]) -> Void = { (players) in
            
            self.quidditchPlayers = players
            self.playerTableView.delegate = self
            self.playerTableView.dataSource = self
            self.playerTableView.reloadData()
        }
        fetchPlayers(fetchPlayersCompleted: fetchPlayersCompleted)
    }
    
    func fetchPlayers(fetchPlayersCompleted: @escaping ([Player]) -> ()) {
        
        if let url = URL(string: "https://cjmobileapps.com/api/v1/quidditch/players") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let players = try JSONDecoder().decode([Player].self, from: data)
                        
                        self.fetchPositions(players: players, fetchPlayersCompleted: fetchPlayersCompleted)
                        
                    } catch let error {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    func fetchPositions(players: [Player], fetchPlayersCompleted: @escaping ([Player]) -> ()) {
        var players = players
        
        if let url = URL(string: "https://cjmobileapps.com/api/v1/quidditch/positions") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let positions = try JSONDecoder().decode([Position].self, from: data)
                        
                        var positionsDict = [Int:String]()
                        
                        positions.forEach{ position in
                            positionsDict[position.id] = position.positionName
                        }
                        
                        for (index, player) in players.enumerated() {
                            players[index].positionName = positionsDict[player.position]
                        }
                        
                        DispatchQueue.main.async {
                            fetchPlayersCompleted(players)
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
