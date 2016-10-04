//
//  Copyright © 2016 Invictus. All rights reserved.
//

import UIKit

class ConverstionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var fahrenheitField: UITextField!
    
    var fahrenheitValue : Double?
    var celsiusValue : Double?
    
    //MARK : View lifecycle starts here.
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("I'm calling you baby")
        
        fahrenheitField.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Actions
    
    
    @IBAction func fahrenheitFieldEditingChanged(_ sender: UITextField) {
        
        print("f value = \(fahrenheitValue)")
        if let text = sender.text, let num : NSNumber = numberFormatter.number(from: text) {
            
            self.fahrenheitValue = num.doubleValue
            self.celsiusValue = convertedFahrenheit(value: fahrenheitValue!)
            updateCelsiusLabel()
            
        } else {
            
            self.celsiusLabel.text = "?????"
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
        self.fahrenheitField.resignFirstResponder()
    }
    //MARK : Conversion Methods
    
    func convertedCelsius(value: Double) -> Double {
        return (value + 32) * (9.0 / 5.0)
    }
    
    func convertedFahrenheit(value: Double) -> Double {
        return (value - 32) * (5.0 / 9.0)
    }
    
    let numberFormatter : NumberFormatter = {
        
        let f = NumberFormatter()
        f.numberStyle = .decimal
        f.minimumFractionDigits = 0
        f.maximumFractionDigits = 1
        return f
    } ()
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    
}

extension ConverstionViewController {
    
    @objc(textField:shouldChangeCharactersInRange:replacementString:) func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentLocale = NSLocale.current
        let decimalSeparator = (currentLocale as NSLocale).object(forKey: NSLocale.Key.decimalSeparator) as! String
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    
}


















