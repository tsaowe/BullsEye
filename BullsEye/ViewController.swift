//
//  ViewController.swift
//  BullsEye
//
//  Created by 巍 曹 on 7/17/15.
//  Copyright (c) 2015 巍 曹. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider :UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        
        
        var title: String
        if difference == 0 {
            title = "Perfect!"
            points = points + 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points = points + 50
            }
            
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .Alert
        )
        
        let action = UIAlertAction(
            title: "OK",
            style: .Default,
            handler: {action in
                self.startNewRound()
                self.updateLabels()
            }
        )
        
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
        //startNewRound()
        //updateLabels()
        
    }
    
    
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
        
    }
    /***
     this is a common util
    ****/
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }

    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewGame() {
            round = 0
            score = 0
            startNewRound()
      
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    
}

