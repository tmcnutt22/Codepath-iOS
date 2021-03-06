//
//  ViewController.swift
//  TIPSY - A tipping calculator built in Swift and UIKit
//
//  Created by thomas mcnutt on 7/21/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //make the textfield the first responder and keep the decimal pad open
        billAmountTextField.becomeFirstResponder()
        
        //reload last bill amount
        billAmountTextField.text = String(format: "%.2f",
                                          UserDefaults.standard.double(forKey: "lastAmountEntered"))
        tipAmountLabel.text = "0.00"
        totalLabel.text = "0.00"
    }
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBAction func calculateTip(_ sender: UISegmentedControl) {
        // Get bill amount from text field input
        let bill: Double = Double(billAmountTextField.text!) ?? 0
        
        //saves the last amount entered as a user default
        UserDefaults.standard.setValue(bill, forKey: "lastAmountEntered")
        
        // Get total tip by multiplying tip * tip %
        let tipPercentages: [Double] = [0.15, 0.20, 0.25]
        let tip: Double = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total: Double = bill + tip
        
        //update tip and total amount labels
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.locale = Locale.current
       
        tipAmountLabel.text = numberFormatter.string(from: NSNumber(value: tip)) ?? "0"
        totalLabel.text = numberFormatter.string(from: NSNumber(value: total)) ?? "0"
    }
    
    
}

