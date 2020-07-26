//
//  UIImageViewBlackBorder.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 4/2/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import UIKit

class UIImageViewBlackBorder: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIImageView()
    }

    required init?(coder: NSCoder) {
        fatalError(StringConstants.NOT_USING_STORYBOARDS)
    }

    func setupUIImageView() {
        layer.cornerRadius = 8.0
        layer.masksToBounds = true
        layer.borderColor = Colors.black.cgColor
        layer.borderWidth = 2
    }
}
