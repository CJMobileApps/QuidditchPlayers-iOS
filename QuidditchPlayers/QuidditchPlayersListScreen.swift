//
//  QuidditchPlayersListScreen.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 3/25/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import UIKit

class QuidditchPlayersListScreen: UIViewController {
    
    @IBOutlet weak var playerTableView: UITableView!
    
    var quidditchPlayers: [QuidditchPlayer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quidditchPlayers = createArray()
        
        playerTableView.delegate = self
        playerTableView.dataSource = self
    }
    
    func createArray() -> [QuidditchPlayer] {
        
        var quidditchPlayers: [QuidditchPlayer] = []
        
        let player1 = QuidditchPlayer(image: UIImage(named: "harrypotter")!, name: "Harry Potter 1",house: "Gryffindor", favoriteSubject: "Defense Against The Dark Arts", positionName: "Seeker", yearsPlayed: "[1991, 1992, 1993, 1994, 1995, 1996,  1997]")
        
        let player2 = QuidditchPlayer(image: UIImage(named: "harrypotter")!, name: "Harry Potter 2",house: "Gryffindor", favoriteSubject: "Defense Against The Dark Arts", positionName: "Seeker", yearsPlayed: "[1991, 1992, 1993, 1994, 1995, 1996,  1997]")
        
        let player3 = QuidditchPlayer(image: UIImage(named: "harrypotter")!, name: "Harry Potter 3",house: "Gryffindor", favoriteSubject: "Defense Against The Dark Arts", positionName: "Seeker", yearsPlayed: "[1991, 1992, 1993, 1994, 1995, 1996,  1997]")
        
        let player4 = QuidditchPlayer(image: UIImage(named: "harrypotter")!, name: "Harry Potter 4",house: "Gryffindor", favoriteSubject: "Defense Against The Dark Arts", positionName: "Seeker", yearsPlayed: "[1991, 1992, 1993, 1994, 1995, 1996,  1997]")
        
        let player5 = QuidditchPlayer(image: UIImage(named: "harrypotter")!, name: "Harry Potter 5",house: "Gryffindor", favoriteSubject: "Defense Against The Dark Arts", positionName: "Seeker", yearsPlayed: "[1991, 1992, 1993, 1994, 1995, 1996,  1997]")
        
        quidditchPlayers.append(player1)
        quidditchPlayers.append(player2)
        quidditchPlayers.append(player3)
        quidditchPlayers.append(player4)
        quidditchPlayers.append(player5)
        
        return quidditchPlayers
    }
}

extension QuidditchPlayersListScreen: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quidditchPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quidditchPlayer = quidditchPlayers[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuidditchPlayerCell") as! QuidditchPlayerCell
        
        cell.setPlayer(player: quidditchPlayer)
        
        return cell
    }
}
