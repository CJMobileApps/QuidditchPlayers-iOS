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
        
        self.title = StringConstants.QUIDDITCH_PLAYERS_TITLE
        
        let quidditchPlayersService = QuidditchPlayersService()
        
        playerTableView.tableFooterView = UIView()
        let quidditchViewModel = QuidditchPlayersViewModel(quidditchPlayersService: quidditchPlayersService)
        
        quidditchViewModel.players
            .subscribe(onNext: { players in
                   
                    self.quidditchPlayers = players
                    self.playerTableView.delegate = self
                    self.playerTableView.dataSource = self
                    self.playerTableView.reloadData()
            })
        
        quidditchViewModel.fetchPlayers()
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
