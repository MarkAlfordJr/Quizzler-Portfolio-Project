//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Mark Alford on 10/8/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    //FOR A QUIZ APP, U NEED ARRAY TO STORE THE QUESTIONS. best to use an array of Dictionaries
       let quiz = [
           Question(q: "A slug's blood is green.", a: "True"),
           Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
           Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
           Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
           Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
           Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
           Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
           Question(q: "Google was originally called 'Backrub'.", a: "True"),
           Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
           Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
           Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
           Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
           
       ]
    
    //have var to count through the array, start at 0. in a 2d array, this will be used as the 1d index
    var questionNumber = 0
    var score = 0
    
    //function to check if user answer is equal to 2d index value
    mutating func checkAnswer (_ userAnswer: String) -> Bool{
        print(userAnswer)
        if userAnswer == quiz[questionNumber].a {
            //if so, up the score
            score += 1
            return true
        } else {
            return false
        }
    }
    
    //shows score
    mutating func scoreDisplay() -> Int{
        return score
    }
    
    //shows 1d index, the questions
    func answerDisplay () -> String {
        let answerText = quiz[questionNumber].q
        return answerText
    }
    
    //function to allow the progressView to go along
    func progressDisplay () -> Float {
        let progressComplete = Float(quiz.count)
        let progressTracker = Float(questionNumber + 1)
        let percentage =  progressTracker / progressComplete
        return percentage
    }
    
    mutating func quizLooping () {
        //IMPORTANT, if the variable equal to the array's 1d index is ABOUT to be greater than the length of the array, set it back to 0, to repeat through the array
        if(questionNumber + 1 != quiz.count){
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
}
