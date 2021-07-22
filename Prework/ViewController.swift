//
//  ViewController.swift
//  Prework
//
//  Created by thomas mcnutt on 7/21/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    @IBAction func calculateTip(_ sender: UISegmentedControl) {
        // Get bill amount from text field input
        let bill: Double = Double(billAmountTextField.text!) ?? 0.0
        
        // Get total tip by multiplying tip * tip %
        let tipPercentages: [Double] = [0.15, 0.20, 0.25]
        let tip: Double = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total: Double = bill + tip
        //update tip and total amount labels
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoSum()
    }
    
    func twoSum() -> Int{
        return 0
    }
}

