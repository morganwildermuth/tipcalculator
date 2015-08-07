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

    override func viewDidLoad() {
        super.viewDidLoad()
        println("\(billTotalFromSegue)")
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showHorseDetail"{
//            let horseDetailController = segue.destinationViewController as! HorseDetailViewController
//            horseDetailController.horse = Horse(index: 0)
//        }
        println("in prepare for segue")
    }

}