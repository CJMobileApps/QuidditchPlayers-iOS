//
//  LabelBodyAlternateTextColor.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 3/27/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import Foundation
import UIKit

class LabelBodyAlternateTextColor: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }

    func setupTextField() {
        textColor = Colors.gray
        font = Fonts.SystemFont.size17()
    }
}
