//
//  ConversionViewController.swift
//  CurrencyConverter
//
//  Created by Ben Hardy on 6/20/23.
//

import UIKit

class ConversionViewController: UIViewController {
    
    var dollars = ""
    var euros = ""
    var canadian = ""
    var pounds = ""
    var yen = ""
    
    
    @IBOutlet weak var dollarsLabel: UILabel!
    
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var canadianLabel: UILabel!
    @IBOutlet weak var poundsLabel: UILabel!
    @IBOutlet weak var yenLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dollarsLabel.text = "USD: $" + dollars
        euroLabel.text = "Euro: " + euros
        canadianLabel.text = "Canadian Dollars: " + canadian
        poundsLabel.text = "Pounds: " + pounds
        yenLabel.text = "Yen: " + yen

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
    */

}
