//
//  ViewController.swift
//  dutchpay
//
//  Created by 임희찬 on 2022/07/14.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipValue = 0.00
    var splitNum = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    @IBOutlet weak var billTextFiled: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    // 버튼 선택
    @IBAction func tipChanged(_ sender: UIButton) {
        //입력란 닫기
        billTextFiled.endEditing(true)
    
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tipValue = buttonTitleAsANumber / 100
        print(tipValue)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNum  =  Int(sender.value)
        splitNumberLabel.text =  String(splitNum)
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
       let bill  =  billTextFiled.text!
        //( 전체 / 팁 )-> ( 전체 + 앞에서 구한값 ) = total /splicNum
        if bill  !=  ""{
            billTotal = Double(bill)!
            let result = billTotal * (1 + tipValue) / Double(splitNum)
            finalResult = String(format: "%.2f", result)
            print(finalResult)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tipValue * 100)
            destinationVC.split = splitNum
        }
    }
}

