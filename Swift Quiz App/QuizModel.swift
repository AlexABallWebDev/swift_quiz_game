//
//  QuizModel.swift
//  Swift Quiz App
//
//  Created by Ball,  Alexander on 5/26/16.
//  Copyright © 2016 Ball,  Alexander. All rights reserved.
//

import Foundation

/// This class represents a true/false quiz being taken by the user.
/// The quiz will offer 3 random questions, from a list of at least 10 possible 
/// questions, that must be answered. The user's score will increase by 1
/// for each question that is correctly answered.
public class QuizModel {
    
    /// Used to access static properties.
    struct Static {
        /// Default number of questions for each quiz.
        private static let defaultNumQuestions = 3
        
        /// The full list of questions that could be asked.
        private static let fullQuestionList = [
            Question(question: "Is water wet?", correctAnswer: true),
            Question(question: "Is fire hot?", correctAnswer: true),
            Question(question: "Is ice cold?", correctAnswer: true),
            Question(question: "Is 5 greater than 6?", correctAnswer: false),
            Question(question: "Can deer fly?", correctAnswer: false),
            Question(question: "Is this app working?", correctAnswer: true),
            Question(question: "Are puzzles puzzling?", correctAnswer: true),
            Question(question: "Can dolphins breathe air?", correctAnswer: true),
            Question(question: "Are potatoes fruits?", correctAnswer: false),
            Question(question: "Is false equal to true?", correctAnswer: false)
        ]
    }
    
    /// The list of questions used in this quiz.
    public private(set) var questions: [Question]
    
    /// The user's score for this quiz.
    public private(set) var score: Int
    
    /// The question that the user is currently on. This question
    /// will be answered if answerQuestion is called.
    public private(set) var currentQuestionNum: Int
    
    /// The number of questions that the user has answered so far.
    public private(set) var numQuestionsAnswered: Int
    
    /// The number of questions in this quiz.
    public private(set) var numQuestions: Int
    
    /// Builds a new QuizModel with 3 random questions.
    public init() {
        score = 0
        currentQuestionNum = 0
        numQuestionsAnswered = 0
        numQuestions = Static.defaultNumQuestions
        
        questions = [Question]()
        
        //simple array to track which questions have been 
        //added to this game.
        var chosenQuestionNums = [Int]()
        
        //add random questions to questions array.
        for _ in 1...(numQuestions) {
            //get a random number between 0 (inclusive) and the 
            //number of elements in the full question 
            //list (exclusive). Basically, pick a random question.
            var questionNum = Int(arc4random_uniform(UInt32(Static.fullQuestionList.count)))
            while chosenQuestionNums.contains(questionNum) {
                questionNum = Int(arc4random_uniform(UInt32(Static.fullQuestionList.count)))
            }
            
            chosenQuestionNums.append(questionNum)
            questions.append(Static.fullQuestionList[questionNum])
        }
    }
    
    /// Returns the text of the current question.
    public func getCurrentQuestionText() -> String {
        return questions[currentQuestionNum].question
    }
    
    /// Returns true if the current question has been answered,
    /// false otherwise.
    public func isCurrentQuestionAnswered() -> Bool {
        return questions[currentQuestionNum].answer != nil
    }
    
    /// Returns true if the current question was answered correctly,
    /// false if it was answered incorrectly, or nil if it has not
    /// been answered yet.
    public func isCurrentQuestionAnsweredCorrectly() -> Bool? {
        if isCurrentQuestionAnswered() {
            return questions[currentQuestionNum].isCorrectlyAnswered()!
        }
        
        return nil
    }
    
    /// Returns true if the number of questions answered has reached or exceeded
    /// the number of questions in this quiz.
    public func isGameOver() -> Bool {
        return numQuestionsAnswered >= numQuestions
    }
    
    /// This method advances currentQuestion by 1 (to the next question).
    /// Returns true if successful, false if the current question is the
    /// last question.
    public func nextQuestion() -> Bool {
        
        //if this is the last question, do not advance.
        if currentQuestionNum >= numQuestions - 1 {
            return false
        }
        
        currentQuestionNum += 1
        return true
    }
    
    /// This method decreases currentQuestion by 1 (to the previous question).
    /// Returns true if successful, false if the current question is the
    /// first question.
    public func previousQuestion() -> Bool {
        
        //if this is the last question, do not advance.
        if currentQuestionNum <= 0 {
            return false
        }
        
        currentQuestionNum -= 1
        return true
    }
    
    /// This method answers the current question with the given answer.
    /// It will then try to advance to the next question. This method will
    /// return true if the answer matches the actual correct answer for the 
    /// question, false otherwise.
    ///
    /// - parameters
    ///     - answer: The answer to be given to the current question.
    public func answerQuestion(answer: Bool) -> Bool? {
        
        //if the game is over, return nil.
        if isGameOver() {
            return nil
        }
        
        //assume the user is wrong
        var isCorrect = false
        
        //only increase the user's score if they have
        //not answered this question before.
        var unscored = false
        
        //if the question has not been answered yet,
        //increment numQuestionsAnswered.
        if questions[currentQuestionNum].answer == nil {
            unscored = true
            numQuestionsAnswered += 1
        }
        
        //if the user's answer matches the correct answer, increase their score
        //and set isCorrect to true.
        if questions[currentQuestionNum].answerQuestion(answer) {
            isCorrect = true
            
            //if the question has not been answered already, increase score.
            if unscored {
                score += 1
            }
        }
        
        //advance to the next question.
        nextQuestion()
        
        //return true if the user was correct, false otherwise.
        return isCorrect
    }
}



































