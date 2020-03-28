//
//  QuidditchPlayer.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 3/26/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import Foundation
import UIKit

class QuidditchPlayer {
    
    var image: UIImage
    var name: String
    var house: String
    var favoriteSubject: String
    var positionName: String
    var yearsPlayed: String
    
    init(
        image: UIImage,
        name: String,
        house: String,
        favoriteSubject: String,
        positionName: String,
        yearsPlayed: String
    ) {
        
        self.image = image
        self.name = name
        self.house = house
        self.favoriteSubject = favoriteSubject
        self.positionName = positionName
        self.yearsPlayed = yearsPlayed
    }    
}
