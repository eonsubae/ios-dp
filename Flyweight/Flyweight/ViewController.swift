//
//  ViewController.swift
//  Flyweight
//
//  Created by KRENGLSSEAN on 2021/04/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let flyColor = UIColor.rgba(1, 0, 0, 1)
        let flyColor2 = UIColor.rgba(1, 0, 0, 1)

        print(flyColor == flyColor2) // true
    }


}

