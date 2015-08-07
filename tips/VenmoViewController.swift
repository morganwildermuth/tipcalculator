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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        roundApproveVenmoButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}