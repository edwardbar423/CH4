//
//  ConverstionViewController.swift
//  World Trotter
//
//  Created by Andrew Barber on 9/20/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import UIKit

class ConverstionViewController: UIViewController {

    //Variables here, things that store data
    
    @IBOutlet var celsiusLabel: UILabel!
    
    @IBOutlet var fahrenheitField: UITextField!
    
    var fahrenheitValue : Double = 0.0
    var celsiusValue : Double = 0.0
    
    //view lifecycle starts here.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // let or var | name | : | type | = value
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Actions
    
    
    @IBAction func fahrenheitFieldEditingChanged(_ sender: UITextField) {
        
        if let text = sender.text, let value = Double(text) {

            self.fahrenheitValue = value
            self.celsiusValue = convertedFahrenheit(value: self.fahrenheitValue)
            updateCelsiusLabel()
        }
    }

    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        self.fahrenheitField.resignFirstResponder()
    }
    //Conversion Methods
    
    func convertedCelsius(value: Double) -> Double {
        return value - 32 * (5.0 / 9.0)
    }
    
    func convertedFahrenheit(value: Double) -> Double {
        return value * (9.0/5.0) + 32
    }
    
    func updateCelsiusLabel() {
        self.celsiusLabel.text = "\(self.celsiusValue)"
    }
    
}

