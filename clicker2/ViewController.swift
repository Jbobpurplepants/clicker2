//
//  ViewController.swift
//  clicker2
//
//  Created by Phipps, Jacob - Student on 4/20/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clicksLabel: UILabel!
    
    @IBOutlet weak var clickButton: UIButton!
    
    @IBOutlet weak var buyClickerButton: UIButton!
    
    @IBOutlet weak var buyClickerLabel: UILabel!
    var clicks = 0.0 {
        didSet {
            clicksLabel.text = "Clicks: \(clicks)"
        }
    }
    
    var clicker = 10.0 {
        didSet {
            buyClickerLabel.text = "Buy Clicker: \(clicker)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickButton.layer.cornerRadius = 16
    }
    
    @IBAction func clickButtonPressed(_ sender: Any) {
        clicks = clicks + 1.0
        
    }
    @IBAction func buyClickerButtonPressed(_ sender: Any) {
        if clicks < clicker {
            return
        }
        if clicks >= clicker {
            clicks -= clicker
            clicker = clicker * 1.2
            clicks = clicks + 1.0
            
        }
        
    }
    
}
