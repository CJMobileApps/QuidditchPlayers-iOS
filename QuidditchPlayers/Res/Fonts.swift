//
//  Fonts.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 3/26/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import Foundation
import UIKit

struct Fonts {
    
    struct SystemFont {
        static func size17() -> UIFont {
            if #available(iOS 9,*) {
                return UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.light)
            } else {
                return UIFont.systemFont(ofSize: 17)
            }
        }
    }
    
    struct BoldSystemFont {
        static func size17() -> UIFont {
            return UIFont.boldSystemFont(ofSize: 17)
        }
    }    
}
