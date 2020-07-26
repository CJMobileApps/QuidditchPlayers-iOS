//
// Created by Chris Jones on 7/25/20.
// Copyright (c) 2020 cjmobileapps. All rights reserved.
//

import Foundation
import UIKit

class HeaderAndTextView: UIView {

    let headerLabel = LabelBodyAlternateTextColor()
    let textLabel = LabelBodyPrimaryTextColor()

    required init(coder: NSCoder) {
        fatalError(StringConstants.NOT_USING_STORYBOARDS)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    func setupView() {
        self.addSubview(headerLabel)
        self.addSubview(textLabel)

        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false


        headerLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        headerLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.24).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        headerLabel.numberOfLines = 2

        textLabel.numberOfLines = 2
        textLabel.leadingAnchor.constraint(equalTo: headerLabel.trailingAnchor, constant: 5).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor).isActive = true
    }
}
