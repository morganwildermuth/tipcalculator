//
//  VenmoViewController.swift
//  tips
//
//  Created by Morgan Wildermuth on 8/5/15.
//  Copyright (c) 2015 WEF6. All rights reserved.
//

import UIKit
import Venmo_iOS_SDK

class VenmoViewController: UIViewController {

    @IBOutlet weak var billAmount: UITextField!
    var billTotalFromSegue: String?
    @IBOutlet weak var approveVenmo: UIButton!
    @IBOutlet weak var venmoReceiver: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resultsDetailView: UIView!
    @IBOutlet weak var resultDetails: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        roundApproveVenmoButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsDetailView.hidden = true
        billAmount.text = billTotalFromSegue
        // Do any additional setup after loading the view.
    }

    private func roundApproveVenmoButton() {
        approveVenmo.layer.cornerRadius = 10
        approveVenmo.layer.borderWidth = 2
        approveVenmo.layer.borderColor = UIColor(red:0.25, green:0.4,blue:0.24,alpha:1.0).CGColor
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
    
    @IBAction func sendVenmoPayment(sender: AnyObject) {
        var intBillAmountInCents = String(dropFirst(billTotalFromSegue!.stringByReplacingOccurrencesOfString(".", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil))).toInt()!
        var test = "1".toInteger()
        Venmo.sharedInstance().sendPaymentTo(venmoReceiver.text, amount: test, note: "Test", audience: VENTransactionAudience.Private) {
            (transaction, happen, error) -> Void in
            if error == nil {
                self.resultsDetailView.backgroundColor = UIColor.greenColor()
                self.resultLabel.text = "Success!"
                self.resultDetails.text = "\(self.billAmount.text) was sent to \(self.venmoReceiver.text)"
                self.resultLabel.sizeToFit()
                self.resultsDetailView.hidden = false
            } else {
                println("\(error)")
                self.resultsDetailView.backgroundColor = UIColor.redColor()
                self.resultLabel.text = "Failure!"
                self.resultDetails.text = "Are you sure the email or phone number is correct?"
                self.resultLabel.sizeToFit()
                self.resultsDetailView.hidden = false
            }
        }
    }
}