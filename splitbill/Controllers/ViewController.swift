//
//  ViewController.swift
//  splitbill
//
//  Created by phillip jarrar on 6/19/23.
//

import UIKit

class ViewController: UIViewController {
    
   
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var percentChosen: Float?
    var splitNumberChosen: Float?
    var totalAmount: Float?
    var answer: Float?
    
    let calculateTip = CalculateTip()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        percentChosen = 0.1
        splitNumberChosen = 1.0
        totalAmount = 0.0
        
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if let currentButton = sender.currentTitle {
            if currentButton == "0%"{
                zeroPctButton.isSelected = true
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = false
                percentChosen = Float(0.0)
            } else if currentButton == "10%"{
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = true
                twentyPctButton.isSelected = false
                percentChosen = Float(0.1)
            } else {
                zeroPctButton.isSelected = false
                tenPctButton.isSelected = false
                twentyPctButton.isSelected = true
                percentChosen = Float(0.2)
            }
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        splitNumberChosen = Float(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalAmount = billTextField.text ?? "0.0"
//        print(percentChosen ?? 0.0)
//        print(splitNumberChosen ?? 0)
//        print(totalAmount ?? 0.0)
        answer = calculateTip.calculate(totalAmount: Float(totalAmount) ?? 0.0, percentTipped: percentChosen ?? 0.0, totalPeople: splitNumberChosen ?? 0.0)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = String(answer!)
            destinationVC.settings = "split between \(String(Int(splitNumberChosen ?? 0.0))) people, with a \(calculateTip.decimalToPercent(percent: percentChosen)) % tip."
        }
    }
    
    



}

