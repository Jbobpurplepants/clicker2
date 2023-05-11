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
    
    @IBOutlet weak var nutsLabel: UILabel!
    
    @IBOutlet weak var clickButton: UIButton!
    
    @IBOutlet weak var buyClickerButton: UIButton!
    
    @IBOutlet weak var buyBotanistButton: UIButton!
    
    @IBOutlet weak var buyClickerLabel: UILabel!
    
    @IBOutlet var buyBotanistLabel: UILabel!
    
    @IBOutlet weak var BuySquirrelLabel: UILabel!
    
    @IBOutlet weak var leavesPerSecond: UILabel!
    
    @IBOutlet weak var buyLumberjackLabel: UILabel!
    
    @IBOutlet weak var tapperAmount: UILabel!
    
    @IBOutlet weak var botanistAmount: UILabel!
    
    @IBOutlet weak var lumberjackAmount: UILabel!
    
    @IBOutlet weak var squirrelAmount: UILabel!
    
    @IBOutlet weak var buyClickerUpgradeLabel: UILabel!
    
    @IBOutlet weak var buySaplingLabel: UILabel!
    @IBOutlet weak var clickerUpgradeAmount: UILabel!
    
    
    @IBOutlet weak var buyLogCabinLabel: UILabel!
    
    @IBOutlet weak var logCabinAmount: UILabel!
    @IBOutlet weak var saplingAmount: UILabel!
    
    
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
    
    var nuts = 0.0 {
        didSet {
            nutsLabel.text = "Nuts: \(nuts)"
        }
    }
    
    var clicker = 10.0 {
        didSet {
            buyClickerLabel.text = "Tapper: \(roundedValueClicker)"
            
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
    var squirAmount = 0 {
        didSet {
            squirrelAmount.text = "\(squirAmount) Squirrel(s)"
        }
    }
    var clickrUpgradeAmount = 0 {
        didSet {
            clickerUpgradeAmount.text = "\(clickrUpgradeAmount) Clicking Upgrade(s)"
        }
    }
    
    var logAmount = 0 {
        didSet {
            logCabinAmount.text = "\(logAmount) Log Cabin(s)"
        }
    }
    
    var sapAmount = 0 {
        didSet {
            saplingAmount.text = "\(sapAmount) Sapling(s)"
        }
    }
    
    var botanist = 100.0 {
        didSet {
            buyBotanistLabel.text = "Botanist: \(roundedValueBotanist)"
        }
    }
    
    var lumberjack = 5000.0 {
        didSet {
            buyLumberjackLabel.text = "LumberJack: \(roundedValueLumberjack)"
        }
    }
    
    var squirrel = 10000.0 {
        didSet {
            BuySquirrelLabel.text = "Squirrel: \(roundedValueSquirrel)"
        }
    }
    
    var clickerUpgrade = 10.0 {
        didSet {
            buyClickerUpgradeLabel.text = "Clicking Upgrade: \(roundedClickingUpgrade) Nuts"
        }
    }
    
    var log = 20000.0 {
        didSet {
            buyLogCabinLabel.text = "Log Cabin: \(roundedLogCabin)"
        }
    }
    var sapling = 100000.0 {
        didSet {
            buySaplingLabel.text = "Sapling: \(roundedValueSapling)"
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
    var valueSquirrel : Double {
        get {
            return squirrel
        }
    }
    var roundedValueSquirrel : Double {
        get {
            round(valueSquirrel * 100) / 100.0
        }
    }
    var clickingUpgrade : Double {
        get {
            return clickerUpgrade
        }
    }
    var roundedClickingUpgrade : Double {
        get {
            round(clickingUpgrade * 100) / 100.0
        }
    }
    var logCabin : Double {
        get {
            return log
        }
    }
    var roundedLogCabin : Double {
        get {
            round(logCabin * 100) / 100.0
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
    var valueSapling: Double {
        get {
            return sapling
        }
    }
    var roundedValueSapling: Double {
        round(valueSapling * 100) / 100.0
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
        if clickrUpgradeAmount == 1 {
            clicks = clicks + 9.0
        }
        if clickrUpgradeAmount == 2 {
            clicks = clicks + 10.0
        }
        if clickrUpgradeAmount == 3 {
            clicks = clicks + 11.0
        }
        if clickrUpgradeAmount == 4 {
            clicks = clicks + 12.0
        }
        if clickrUpgradeAmount == 5 {
            clicks = clicks + 14.0
        }
        
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
                lps = lps + 3.3
            }
            if clicker >= 400 {
                lps = lps + 5.3
            }
            if clicker >= 3000 {
                lps = lps + 7.4
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
                clicks = clicks + 3.3
            }
            if clicker >= 400 {
                clicks = clicks + 5.3
            }
            if clicker >= 3000 {
                clicks = clicks + 7.4
            }
        }
        
    }
    
    @IBAction func buyBotanistButton(_ sender: Any) {
        if clicks < botanist {
            return
        }
        if clicks >= botanist {
            if botanist < 500 {
                lps = lps + 2.7
            }
            if botanist >= 500 {
                lps = lps + 3.9
            }
            clicks -= botanist
            botanist = botanist * 1.9
            botAmount += 1
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                updateCounting()
            })
            func updateCounting (){
                clicks = clicks + 5.7
                if botanist >= 500 {
                    clicks = clicks + 8.9
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
                clicks = clicks + 24.3
                if lumberjack >= 10000 {
                    clicks = clicks + 45.6
                    
                }
            }
        }
        
    }
    
    @IBAction func buySquirrelButton(_ sender: Any) {
        if clicks < squirrel {
            return
        }
        if clicks >= squirrel {
            clicks -= squirrel
            squirrel = squirrel * 2
            squirAmount += 1
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                updateCounting()
            })
            func updateCounting (){
                nuts = nuts + 1
            }
        }
        
    }
    @IBAction func buyClickerUpgradeButton(_ sender: Any) {
        if nuts < clickerUpgrade {
            return
        }
        if nuts >= clickerUpgrade {
            nuts -= clickerUpgrade
            clickrUpgradeAmount += 1
            clickerUpgrade = clickerUpgrade * 4
        }
        
    }
    
    @IBAction func buyLogCabinButton(_ sender: Any) {
        if clicks < log {
            return
        }
        if clicks >= log {
            clicks -= log
            log = log * 1.3
            logAmount += 1
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                updateCounting()
            })
            func updateCounting (){
                clicks = clicks + 100.3
            }
        }
        
    }
    
    
    @IBAction func buySaplingButton(_ sender: Any) {
        if clicks < sapling {
            return
        }
        if clicks >= sapling {
            clicks -= sapling
            sapling = sapling * 1.2
            sapAmount += 1
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
                updateCounting()
            })
            func updateCounting (){
                clicks = clicks + 404.4
            }
        }
    }
}
