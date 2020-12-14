//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //link all ui elements to code, sometimes buttons need an outlet of their own
    @IBOutlet weak var questionsView: UILabel!
    @IBOutlet weak var answerProgress: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreDisplay: UILabel!
    
    //a var to refer to the Model Logic
    var quizBrain = QuizBrain()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //have the function, that loads the quiz data, be the first thing that loads
        questionUpdate()
        
    }
    
    //MARK: - Quiz progress functionality
    @IBAction func answerButtons(_ sender: UIButton) {
        //OBJ: this function, goes through the array/struct of questions. if the user answer is true, we continue along with the array/struct. if not, the array/struct stays still, until we chosse the right answer. when all the questions are up, we REPEAT through the array/struct again.
        
        
        //set up user answer, button titles make into a switch statement
        let userAnswer = sender.currentTitle! // true or false
        //since 2d array, have actual answer be the 2d index of the array
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
       
        //starts quiz rolling along
        quizBrain.quizLooping()
        
        //if user is right,
        if(userGotItRight){
            sender.backgroundColor = UIColor.green
            print("right")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // Change `0.2` to the desired number of seconds.
                // Code you want to be delayed
                self.questionUpdate()
            }
        } else{ //if user is wrong
            sender.backgroundColor = UIColor.red
            print("wrong")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // Change `0.2` to the desired number of seconds.
                // Code you want to be delayed
                self.questionUpdate()
            }
        }
    }
    
    //make a function that shows the data of the array in the model struct, connect it to the label UI. refer to the questions in the struct's array, and start at the 1d first index, 2d first index
    func questionUpdate (){
        questionsView.text = quizBrain.answerDisplay()
        scoreDisplay.text = "score: \(quizBrain.scoreDisplay())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        answerProgress.progress = quizBrain.progressDisplay()
    }
    
    
}

