//
//  ResultsViewController.swift
//  dutchpay
//
//  Created by 임희찬 on 2022/07/14.
//

import UIKit

class ResultsViewController: UIViewController {

    var result = "0.0"
    var tip = 10
    var split = 2
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingLabel.text = "Split between \(split) people, with \(tip)% tip."
        
    }
    

    @IBAction func recalculatedPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
