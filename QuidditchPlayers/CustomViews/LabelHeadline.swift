//
//  TextFieldHeadline.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 3/26/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//
import Foundation
import UIKit

class LabelHeadline: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
    }

    func setupTextField() {
        textColor = Colors.black
        font = Fonts.BoldSystemFont.size17()
    }
}
