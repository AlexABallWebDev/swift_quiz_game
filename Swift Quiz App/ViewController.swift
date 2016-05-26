//
//  ViewController.swift
//  Swift Quiz App
//
//  Created by Ball,  Alexander on 5/19/16.
//  Copyright © 2016 Ball,  Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // The QuizModel for this quiz.
    var quizModel: QuizModel! = nil
    
    // The textfield for the question text
    @IBOutlet weak var questionText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // create a new quiz
        quizModel = QuizModel()
        
        //show the first question
        questionText.text = quizModel.getCurrentQuestionText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showMessage() {
        let alertController = UIAlertController(title: "Welcome to My First App", message: "Hello World", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    func updateScreen() {
        
        if quizModel.isCurrentQuestionAnswered() && false {
            //handle case where question was already answered
        } else {
            
        }
    }
}

