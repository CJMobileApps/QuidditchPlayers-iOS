//
//  QuidditchPlayerCell.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 3/26/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import UIKit

class QuidditchPlayerCell: UITableViewCell {

    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: LabelHeadline!
    @IBOutlet weak var playerPosition: LabelBodyAlternateTextColor!
    @IBOutlet weak var playerHouse: LabelBodyPrimaryTextColor!
    @IBOutlet weak var playerFavoriteSubject: LabelBodyPrimaryTextColor!
    @IBOutlet weak var playerYearsPlayed: LabelBodyPrimaryTextColor!
    @IBOutlet weak var playerStatus: LabelBodyPrimaryTextColor!
    
    func setPlayer(player: QuidditchPlayer) {
        playerImage.image = player.image
        playerName.text = player.name
        playerPosition.text = player.positionName
        playerHouse.text = player.house
        playerFavoriteSubject.text = player.favoriteSubject
        playerYearsPlayed.text = player.yearsPlayed
        playerStatus.text = "Harry Potter is eating"
    }
}
