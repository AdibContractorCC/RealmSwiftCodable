//
//  ViewController.swift
//  RealmSwiftCodable
//
//  Created by Adib Contractor on 10/9/18.
//  Copyright © 2018 Adib Contractor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Driver().loadBasicModels()
        Driver().storeModels()
    }


}

