//
//  SettingsViewController.swift
//  tips
//
//  Created by Morgan Wildermuth on 8/1/15.
//  Copyright (c) 2015 WEF6. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTip = defaults.doubleForKey("defaultTip")
        var tipPercentages = [0.18, 0.2, 0.22]
        switch defaultTip{
        case 0.18: defaultTipControl.selectedSegmentIndex = 0
        case 0.2: defaultTipControl.selectedSegmentIndex = 1
        case 0.22: defaultTipControl.selectedSegmentIndex = 2
        default: defaultTipControl.selectedSegmentIndex = 1
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    private func setDefaultTip(defaultTip: Double) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(defaultTip, forKey: "defaultTip")
        defaults.synchronize()
        var defaultTip = defaults.doubleForKey("defaultTip")
    }

    @IBAction func tapSetDefaultTip(sender: UISegmentedControl) {
        
        var defaultTipPercentages = [0.18, 0.2, 0.22]
        var defaultTipPercentage = defaultTipPercentages[defaultTipControl.selectedSegmentIndex]
        setDefaultTip(defaultTipPercentage)
        
    }
    
}
