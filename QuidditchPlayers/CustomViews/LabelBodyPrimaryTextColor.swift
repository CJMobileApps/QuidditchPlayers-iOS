//
//  LabelBodyPrimaryTextColor.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 3/27/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import Foundation
import UIKit

class LabelBodyPrimaryTextColor: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringConstants.NOT_USING_STORYBOARDS)
    }

    func setupTextField() {
        textColor = Colors.black
        font = Fonts.SystemFont.size17()
    }
}
