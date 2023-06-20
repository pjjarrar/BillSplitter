//
//  ResultsViewController.swift
//  splitbill
//
//  Created by phillip jarrar on 6/19/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var total: String?
    var settings: String?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = total
        settingsLabel.text = settings

        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
