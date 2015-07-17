//
//  ViewController.swift
//  BullsEye
//
//  Created by 巍 曹 on 7/17/15.
//  Copyright (c) 2015 巍 曹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        
        let alert = UIAlertController(
            title: "hello title",
            message: "this is my first app message",
            preferredStyle: .Alert
        )
        
        let action = UIAlertAction(
            title: "action title",
            style: .Default,
            handler: nil
        )
        
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
        
        
    }


}

