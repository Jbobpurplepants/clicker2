//
//  ViewController.swift
//  clicker2
//
//  Created by Phipps, Jacob - Student on 4/20/23.
//

import UIKit

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var clicksLabel: UILabel!
    
    @IBOutlet weak var clickButton: UIButton!
    
    @IBOutlet weak var buyClickerButton: UIButton!
    
    @IBOutlet weak var buyBotanistButton: UIButton!
    
    @IBOutlet weak var buyClickerLabel: UILabel!
    
    @IBOutlet var buyBotanistLabel: UILabel!
    
    @IBOutlet weak var leavesPerSecond: UILabel!
    
    @IBOutlet weak var buyLumberjackLabel: UILabel!
    
    @IBOutlet weak var tapperAmount: UILabel!
    
    @IBOutlet weak var botanistAmount: UILabel!
    
    @IBOutlet weak var lumberjackAmount: UILabel!
    var lps = 0.0 {
        didSet {
            leavesPerSecond.text = "Leaves Per Second: \(roundedValueLps)"
        }
    }
    
    var clicks = 0.0 {
        didSet {
            clicksLabel.text = "Leaves: \(roundedValueClicks)"
        }
    }
    
    var clicker = 10.0 {
        didSet {
            buyClickerLabel.text = "Buy Tapper: \(roundedValueClicker)"
            
        }
        
    }
    var clickerAmount = 0 {
        didSet {
            tapperAmount.text = "\(clickerAmount) Tapper(s)"
        }
    }
    var botAmount = 0 {
        didSet {
            botanistAmount.text = "\(botAmount) Botanist(s)"
        }
    }
    var lumberAmount = 0 {
        didSet {
            lumberjackAmount.text = "\(lumberAmount) Lumberjack(s)"
        }
    }

    
    
    var botanist = 100.0 {
        didSet {
            buyBotanistLabel.text = "Buy Botanist: \(roundedValueBotanist)"
        }
    }
    
    var lumberjack = 5000.0 {
        didSet {
            buyLumberjackLabel.text = "Buy LumberJack: \(roundedValueLumberjack)"
        }
    }
    var valueClicks : Double {
        get {
            return clicks
        }
    }
    var roundedValueClicks: Double {
        get {
            round(valueClicks * 100) / 100.0
        }
    }
    
    var valueClicker : Double {
        get {
            return clicker
        }
    }
    var roundedValueClicker: Double {
        get {
            round(valueClicker * 100) / 100.0
        }
    }
    var valueBotanist : Double {
        get {
            return botanist
        }
    }
    var roundedValueBotanist: Double {
        get {
            round(valueBotanist * 100) / 100.0
        }
    }
    var valueLumberjack : Double {
        get {
            return lumberjack
        }
    }
    var roundedValueLumberjack: Double {
        get {
            round(valueLumberjack * 100) / 100.0
        }
    }
    var valueLps : Double {
        get {
            return lps
        }
    }
    var roundedValueLps: Double {
        get {
            round(valueLps * 100) / 100.0
        }
    }
    
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clickButton.layer.cornerRadius = 16
        leavesPerSecond.layer.masksToBounds = true
        leavesPerSecond.layer.cornerRadius = 16
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "tree")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    
    @IBAction func clickButtonPressed(_ sender: Any) {
        clicks = clicks + 1.0
        
    }
    @IBAction func buyClickerButtonPressed(_ sender: Any) {
        
        if clicks < clicker {
            return
        }
        if clicks >= clicker {
            if clicker < 100 {
                lps = lps + 1.1
            }
            if clicker >= 100 {
                lps = lps + 1.3
            }
            if clicker >= 400 {
                lps = lps + 2.3
            }
            if clicker >= 3000 {
                lps = lps + 4.4
            }
            
            clicks -= clicker
            clicker = clicker * 1.7
            clickerAmount += 1
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                updateCounting()
            })
        }
        func updateCounting(){
            clicks = clicks + 1.1
            if clicker >= 100 {
                clicks = clicks + 1.3
            }
            if clicker >= 400 {
                clicks = clicks + 2.3
            }
            if clicker >= 3000 {
                clicks = clicks + 4.4
            }
        }
        
    }
    
    @IBAction func buyBotanistButton(_ sender: Any) {
        if clicks < botanist {
            return
        }
        if clicks >= botanist {
            if botanist < 500 {
                lps = lps + 1.6
            }
            if botanist >= 500 {
                lps = lps + 1.9
            }
            clicks -= botanist
            botanist = botanist * 1.9
            botAmount += 1
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                updateCounting()
            })
            func updateCounting (){
                clicks = clicks + 1.6
                if botanist >= 500 {
                    clicks = clicks + 1.9
                }
            }
        }
    }
    
    @IBAction func buyLumberjackButton(_ sender: Any) {
        if clicks < lumberjack {
            return
        }
        if clicks >= lumberjack {
            clicks -= lumberjack
            lumberjack = lumberjack * 1.7
            lumberAmount += 1
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                updateCounting()
            })
            func updateCounting (){
                clicks = clicks + 10.3
                if lumberjack >= 10000 {
                    clicks = clicks + 15.6
                    
                }
            }
        }
        
    }
}

