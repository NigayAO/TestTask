//
//  HZViewController.swift
//  TestForWork
//
//  Created by Alik Nigay on 26.05.2022.
//

import UIKit

class HZViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var receivedData: InternalData!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "hz"
        if receivedData != nil {
            textLabel.text = receivedData.text
        } else {
            textLabel.text = "Nope"
        }
        
    }
}
