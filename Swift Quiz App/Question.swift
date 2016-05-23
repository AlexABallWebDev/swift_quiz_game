//
//  Question.swift
//  Swift Quiz App
//
//  Created by Ball,  Alexander on 5/22/16.
//  Copyright © 2016 Ball,  Alexander. All rights reserved.
//

import Foundation

/// This class represents a true/false question for use in the Swift Quiz App.
/// Questions keep track of the question itself, the correct answer,
/// and the answer that the user gave for this question.
public class Question {
    /// A true/false question.
    public private(set) var question: String
    
    /// The correct answer to the question.
    public private(set) var correctAnswer: Bool
    
    /// The answer that the user gave for this question. 
    /// It is nil if the question has not been answered yet.
    public private(set) var answer: Bool?
    
    /// This method constructs a new Question object that contains
    /// a true/false question and a correct answer.
    ///
    /// - parameters
    ///     - question: The question itself, in string form.
    ///     - correctAnswer: The correct answer to this question.
    public init(question: String, correctAnswer: Bool) {
        
        self.question = question
        self.correctAnswer = correctAnswer
    }
    
    /// This method answers the question and returns true if
    /// the answer matches the correctAnswer, false otherwise.
    ///
    /// - parameters
    ///     - userAnswer: The user's answer.
    public func answerQuestion(userAnswer: Bool) -> Bool {
        
        answer = userAnswer
        
        // Return true if the answer is correct, false otherwise.
        // The exclamation point signifies that I know this particular
        // method call will never return nil. This is because
        // the above line sets the answer for this question.
        return isCorrectlyAnswered()!
    }
    
    ///This method returns nil if the question has not been
    ///answered yet, true if the answer matches correctAnswer,
    ///false otherwise.
    public func isCorrectlyAnswered() -> Bool? {
        
        if answer != nil {
            return answer == correctAnswer
        }
        
        return nil
    }
    
    ///Returns a copy of this Question.
    public func copyQuestion() -> Question {
        return Question(question: self.question, correctAnswer: self.correctAnswer)
    }
}