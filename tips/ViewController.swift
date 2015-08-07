//
//  ViewController.swift
//  tips
//
//  Created by Morgan Wildermuth on 7/29/15.
//  Copyright (c) 2015 WEF6. All rights reserved.
//

import UIKit
import Venmo_iOS_SDK

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var detailsPanel: UIView!
    @IBOutlet weak var totalPanel: UIView!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var paypalButton: UIButton!
    @IBOutlet weak var stripeButton: UIButton!
    
    private func modifyPayButtonUI(){
        var payButtons = [payButton, paypalButton, stripeButton]
        for payButton in payButtons {
            payButton.layer.cornerRadius = 10
            payButton.layer.borderWidth = 2
            payButton.layer.borderColor = UIColor(red:0.25, green:0.4,blue:0.24,alpha:1.0).CGColor
        }
    }

    private func setDefaultTip() {
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTip = defaults.doubleForKey("defaultTip")
        var tipPercentages = [0.18, 0.2, 0.22]
        switch defaultTip{
        case 0.18: tipControl.selectedSegmentIndex = 0
        case 0.2: tipControl.selectedSegmentIndex = 1
        case 0.22: tipControl.selectedSegmentIndex = 2
        default: tipControl.selectedSegmentIndex = 1
        }
    }

    private func setDetailsPanelStatus() {
        if billField.text == "" {
            detailsPanel.hidden = true
            paypalButton.hidden = true
            stripeButton.hidden = true
        } else {
            detailsPanel.hidden = false
            paypalButton.hidden = false
            stripeButton.hidden = false
            moveViewUpForKeyboard()
        }
    }
    
    private func moveViewUpForKeyboard(){
        UIView.animateWithDuration(1, animations:  {
            self.totalPanel.frame = CGRect(x: 0, y: 50, width: self.totalPanel.frame.width, height: self.totalPanel.frame.height)
        })
    }
    
    private func calculateTotal(){
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip

        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        setDefaultTip()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
        setDefaultTip()
        setDetailsPanelStatus()
        calculateTotal()
        modifyPayButtonUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        setDetailsPanelStatus()
        calculateTotal()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    

    @IBAction func touchPayButton(sender: AnyObject) {
        Venmo.sharedInstance().defaultTransactionMethod = VENTransactionMethod.API
        Venmo.sharedInstance().requestPermissions(["make_payments", "access_profile"], withCompletionHandler: { (success, error) -> Void in
            if success {
                println("success")
                
            }
            else
            {
                println("fail")
                println("\(error)")
            }
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showVenmoView") {
            if let viewController: VenmoViewController = segue.destinationViewController as? VenmoViewController{
                viewController.billTotalFromSegue = totalLabel.text
            }
            
            
        }
    }

    
}

