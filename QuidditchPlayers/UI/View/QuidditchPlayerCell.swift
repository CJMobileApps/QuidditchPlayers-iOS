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
    
    func setPlayer(player: Player) {
        let imageUrl = URL(string: player.imageUrl)
        playerImage.kf.setImage(with: imageUrl)
        
        playerName.text =  "\(player.firstName) \(player.lastName)"
        playerPosition.text = player.positionName
        playerHouse.text = StringConstants.GRYFFINDOR
        playerFavoriteSubject.text = player.favoriteSubject
        playerYearsPlayed.text = player.yearsPlayed.description
        playerStatus.text = player.status
    }
}
