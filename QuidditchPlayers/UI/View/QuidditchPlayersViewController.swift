//
//  QuidditchPlayersListViewController.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 7/24/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import UIKit
import Kingfisher

class QuidditchPlayersViewController: UIViewController {

    var playerTableView = UITableView()

    var quidditchPlayers: [Player] = []

    let tag = String(describing: QuidditchPlayersViewController.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = StringConstants.QUIDDITCH_PLAYERS_TITLE

        setUpPlayerTableView()
        let quidditchViewModel = QuidditchPlayersViewModel(quidditchPlayersService: QuidditchPlayersService())

        quidditchViewModel.players
                .subscribe(onNext: { players in

            self.quidditchPlayers = players
            self.playerTableView.delegate = self
            self.playerTableView.dataSource = self
            self.playerTableView.reloadData()
        })

        quidditchViewModel.status
                .subscribe(onNext: { status in

            guard let index = quidditchViewModel.playersIndexDict[status.id] else {
                return
            }
            let indexPathRow: Int = index
            self.quidditchPlayers[index].status = status.status
            let indexPosition = IndexPath(row: indexPathRow, section: 0)
            self.playerTableView.reloadRows(at: [indexPosition], with: .none)
        })

        quidditchViewModel.fetchPlayers()
    }

    func setUpPlayerTableView() {
        view.addSubview(playerTableView)
        playerTableView.tableFooterView = UIView()
        playerTableView.delegate = self
        playerTableView.dataSource = self
        playerTableView.register(QuidditchPlayersCell.self, forCellReuseIdentifier: QuidditchPlayersCell.tag)
        playerTableView.pin(to: view)
    }
}

extension QuidditchPlayersViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quidditchPlayers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = quidditchPlayers[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: QuidditchPlayersCell.tag) as! QuidditchPlayersCell
        cell.setPlayer(player: player)

        return cell
    }
}

extension UIView {

    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
