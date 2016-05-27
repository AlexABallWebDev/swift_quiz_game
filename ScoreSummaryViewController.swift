//
//  ScoreSummaryViewController.swift
//  Swift Quiz App
//
//  Created by Ball,  Alexander on 5/27/16.
//  Copyright © 2016 Ball,  Alexander. All rights reserved.
//

import UIKit

class ScoreSummaryViewController: UIViewController {
    
    // The score text field
    @IBOutlet weak var scoreTextField: UILabel!
    
    // The number of questions answered text field
    @IBOutlet weak var numQuestionsAnsweredField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Display the user's score and number of questions answered.
        let score = NSUserDefaults.standardUserDefaults().objectForKey(ViewController.Static.scoreID) as! Int
        
        let numQuestionsAnswered = NSUserDefaults.standardUserDefaults().objectForKey(ViewController.Static.numQuestionsAnsweredID) as! Int
        
        scoreTextField.text = "Your score: \(score)"
        numQuestionsAnsweredField.text = "Number of questions you answered: \(numQuestionsAnswered)"
    }
}
