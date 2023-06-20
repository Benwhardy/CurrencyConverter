//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Hardy on 6/19/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var usdTextField: UITextField!

    @IBOutlet weak var errorLabel: UILabel!
    
    
    var euroSwitch = true
    var canadianSwitch = true
    var poundSwitch = true
    var yenSwitch = true
    
    var euroExchange = 0.92
    var euros = 0.0
    
    var canadianExchange = 1.32
    var canadian = 0.0
    
    var poundsExchange = 0.78
    var pounds = 0.0
    
    var yenExchange = 142.0
    var yen = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usdTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func convert(_ sender: UIButton) {
        guard let usdAmountString = usdTextField.text else {
                // Show error message if the input is empty
                errorLabel.isHidden = false
                errorLabel.text = "Please enter a valid integer"
                return
            }
            
            if let _ = Int(usdAmountString) {
                // Valid integer input
                errorLabel.isHidden = true
            } else {
                // Invalid input (not an integer)
                errorLabel.isHidden = false
                errorLabel.text = "Please enter a valid integer"
                return
            }
        
        self.performSegue(withIdentifier: "toConversion", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toConversion" {
            let conversion = segue.destination as! ConversionViewController
            conversion.dollars = usdTextField.text!
            
            if euroSwitch {
                euros = convertUSDtoEUR(usdAmount: Double(usdTextField.text!)!, exchangeRate: euroExchange)
                conversion.euros = String(euros)
            } else {
                conversion.euros = "not selected"
            }
            
            if canadianSwitch {
                canadian = convertUSDtoEUR(usdAmount: Double(usdTextField.text!)!, exchangeRate: canadianExchange)
                conversion.canadian = String(canadian)
            } else {
                conversion.canadian = "not selected"
            }
            
            if poundSwitch {
                pounds = convertUSDtoEUR(usdAmount: Double(usdTextField.text!)!, exchangeRate: poundsExchange)
                conversion.pounds = String(pounds)
            } else {
                conversion.pounds = "not selected"
            }
            
            if yenSwitch {
                yen = convertUSDtoEUR(usdAmount: Double(usdTextField.text!)!, exchangeRate: yenExchange)
                conversion.yen = String(yen)
            } else {
                conversion.yen = "not selected"
            }
            
            
            
        }
    }
    
    @IBAction func euro(_ sender: UISwitch) {
        if sender.isOn {
             euroSwitch = true
        } else {
            euroSwitch = false
        }
    }
    
    
    @IBAction func canadian(_ sender: UISwitch) {
        if sender.isOn {
             canadianSwitch = true
        } else {
            canadianSwitch = false
        }
    }
    
    
    @IBAction func pounds(_ sender: UISwitch) {
        if sender.isOn {
             poundSwitch = true
        } else {
            poundSwitch = false
        }
    }
    
    
    @IBAction func yen(_ sender: UISwitch) {
        if sender.isOn {
             yenSwitch = true
        } else {
            yenSwitch = false
        }
    }
    
    func convertUSDtoEUR(usdAmount: Double, exchangeRate: Double) -> Double{
        let eurAmount = usdAmount * exchangeRate
        return eurAmount
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Handle the end of editing for the text field
        guard let text = textField.text else {
            return
        }
        
        if let _ = Int(text) {
            // Valid integer input
            errorLabel.isHidden = true
        } else {
            // Invalid input
            errorLabel.isHidden = false
            errorLabel.text = "Please enter a valid integer"
        }
    }
    
        
}


