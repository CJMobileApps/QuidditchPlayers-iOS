//
//  BaseUINaviagtionController.swift
//  QuidditchPlayers
//
//  Created by Chris Jones on 4/4/20.
//  Copyright © 2020 cjmobileapps. All rights reserved.
//

import UIKit

class BaseUINaviagtionController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = Colors.primaryColor
        navigationBar.titleTextAttributes = [.foregroundColor: Colors.white]
        navigationBar.tintColor = Colors.white
    }
}
