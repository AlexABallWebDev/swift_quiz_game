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
    
    // True button
    @IBOutlet var trueButton: UIView!
    
    // False button
    @IBOutlet var falseButton: UIView!
    
    // Previous button
    @IBOutlet var previousButton: UIView!
    
    // Next button
    @IBOutlet var nextButton: UIView!
    
    // The textfield for the question text
    @IBOutlet weak var questionText: UILabel!
    
    // The textfield for a message if the question
    // has already been answered.
    @IBOutlet weak var isAnsweredText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // create a new quiz
        quizModel = QuizModel()
        
        //show the first question
        updateScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// This method selects the previous question, then
    /// updates the screen with the question text.
    @IBAction func handlePreviousButton() {
        quizModel.previousQuestion()
        updateScreen()
    }
    
    /// This method selects the previous question, then
    /// updates the screen with the question text.
    @IBAction func handleNextButton() {
        quizModel.nextQuestion()
        updateScreen()
    }
    
    /// This method answers true to the current question.
    @IBAction func answerTrue() {
        let isCorrect = quizModel.answerQuestion(true)
        
        if isCorrect == nil {
            //do nothing if the game is over.
        }
        if isCorrect! {
            //display a positive message
            showMessage("Correct!")
        } else {
            //display a negative message
            showMessage("Wrong!")
        }
        
        //display the next question.
        updateScreen()
    }
    
    /// This method answers false to the current question.
    @IBAction func answerFalse() {
        let isCorrect = quizModel.answerQuestion(false)
        
        if isCorrect == nil {
            //do nothing if the game is over.
        }
        if isCorrect! {
            //display a positive message
            showMessage("Correct!")
        } else {
            //display a negative message
            showMessage("Wrong!")
        }
        
        //display the next question.
        updateScreen()
    }
    
    /// This method displays an alert with the given message to the user.
    ///
    /// - parameters
    ///     - message: The message to be displayed.
    func showMessage(message: String) {
        let alertController = UIAlertController(title: "Quiz App", message:
            message, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))

        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    /// This method updates the screen with the current question.
    func updateScreen() {
        
        if quizModel.isCurrentQuestionAnswered() {
            // if the question was already answered, display text.
            if quizModel.isCurrentQuestionAnsweredCorrectly()! {
                // handle case where question was correctly answered.
                isAnsweredText.text = "This question was correctly answered."
            } else {
                // handle case where question was incorrectly answered.
                isAnsweredText.text = "This question was incorrectly answered."
            }
        } else {
            // if the question was not answered yet, hide the text.
            isAnsweredText.text = ""
        }
        
        // display question.
        questionText.text = quizModel.getCurrentQuestionText()
        
        // if game is over, switch to score summary view.
        if quizModel.isGameOver() {
            
        }
    }
}

