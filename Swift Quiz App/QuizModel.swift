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
            Question(question: "1 true", correctAnswer: true),
            Question(question: "2 false", correctAnswer: false),
            Question(question: "3 true", correctAnswer: true),
            Question(question: "4 true", correctAnswer: true),
            Question(question: "5 true", correctAnswer: true),
            Question(question: "6 true", correctAnswer: true),
            Question(question: "7 true", correctAnswer: true),
            Question(question: "8 true", correctAnswer: true),
            Question(question: "9 true", correctAnswer: true),
            Question(question: "10 true", correctAnswer: true)
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
        
        //add random questions to questions.
        for i in 0...2 {
            questions.append(Static.fullQuestionList[i])
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
    
    
}



































