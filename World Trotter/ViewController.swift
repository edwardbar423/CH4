//
//  ViewController.swift
//  World Trotter
//
//  Created by Andrew Barber on 9/20/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // let or var | name | : | type | = value
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.blue
        self.view .addSubview(firstView)
        
        let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
        let secondView = UIView(frame:secondFrame)
        secondView.backgroundColor = UIColor.green
        firstView.addSubview(secondView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

