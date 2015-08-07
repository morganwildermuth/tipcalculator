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
    @IBOutlet weak var approveVenmoPayment: UILabel!
    @IBOutlet weak var denyVenmoPayment: UILabel!
    var venmoButtons: [UILabel] = []
    var billTotalFromSegue: String?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        venmoButtons = [approveVenmoPayment, denyVenmoPayment]
        roundButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmount.text = billTotalFromSegue
        // Do any additional setup after loading the view.
    }

    private func roundButtons() {
        for venmoButton in venmoButtons {
            venmoButton.layer.cornerRadius = 10
            venmoButton.layer.borderWidth = 2
            venmoButton.layer.borderColor = UIColor(red:0.25, green:0.4,blue:0.24,alpha:1.0).CGColor
        }
        
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showHorseDetail"{
//            let horseDetailController = segue.destinationViewController as! HorseDetailViewController
//            horseDetailController.horse = Horse(index: 0)
//        }
        println("in prepare for segue")
    }

}