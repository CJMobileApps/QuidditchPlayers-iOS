//
//  Player.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 3/29/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import Foundation

struct Player: Decodable {
    
    let id: String
    let firstName: String
    let lastName: String
    let yearsPlayed: [Int]
    let favoriteSubject: String
    let imageUrl: String
    let position: Int
    var positionName: String?
    var status: String?
}

//TODO update this
//  val fullName: String	    val fullName: String
//    get() = "$firstName $lastName"	        get() = "$firstName $lastName"
