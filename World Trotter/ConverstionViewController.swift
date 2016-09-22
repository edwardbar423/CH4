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
        
        if let text = sender.text, let num : NSNumber = ConverstionViewController.numberFormatter.number(from: text) {
           
            self.fahrenheitValue = num.doubleValue
            self.celsiusValue = convertedFahrenheit(value: self.fahrenheitValue)
            updateCelsiusLabel()
    
        } else {
            
            self.celsiusLabel.text = "???"
        }
    }

    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        self.fahrenheitField.resignFirstResponder()
    }
    //Conversion Methods

    func convertedCelsius(value: Double) -> Double {
        return (value + 32) * (9.0 / 5.0)
    }

    func convertedFahrenheit(value: Double) -> Double {
        return (value - 32) * (5.0 / 9.0)
    }

    func updateCelsiusLabel() {
        self.celsiusLabel.text = ConverstionViewController.numberFormatter.string(from: NSNumber(value: celsiusValue))
    }

    static let numberFormatter : NumberFormatter = {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        return formatter
    } ()
}



















