//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
   var quizManager = QuizManager()
    @IBAction func answerButtonPressed(_ sender: UIButton){
        let userAnswer = sender.currentTitle!
        
        if quizManager.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
            quizManager.score+=1
        }else{
            sender.backgroundColor = UIColor.red
        }
        quizManager.levelUpQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
  @objc func updateUI(){
      questionLabel.text = quizManager.getQuestion().question
      trueButton.backgroundColor = UIColor.clear
      falseButton.backgroundColor = UIColor.clear
      scoreLabel.text = "Score " + String(quizManager.getScore())
      progressBar.progress = quizManager.getProgress()
      
    }


}


