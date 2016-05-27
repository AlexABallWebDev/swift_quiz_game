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


    /// This method updates the screen with the current question.
    func updateScreen() {
        
        if quizModel.isCurrentQuestionAnswered() && false {
            //handle case where question was already answered
        } else {
            //handle case where unanswered question is displayed
            questionText.text = quizModel.getCurrentQuestionText()
        }
        
        //if game is over, switch to score summary view.
    }
}

