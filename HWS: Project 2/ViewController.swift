//
//  ViewController.swift
//  HWS: Project 2
//
//  Created by Deonte on 6/9/19.
//  Copyright © 2019 Deonte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us" ]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }
    
    func resetQuestions(action: UIAlertAction! = nil) {
        score = 0
        questionsAsked = 0
        title = "\(countries[correctAnswer].uppercased())            Score: \(score)"
    }

    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased())            Score: \(score)"
    }

    @IBAction func enterButtonTapped(_ sender: UIButton) {
        var title: String
        var message: String
    
        if questionsAsked < 9 {
            if sender.tag == correctAnswer {
                questionsAsked += 1
                score = score + 1
                title = "Correct"
                message = "Great Job!"
            } else {
                questionsAsked += 1
                score = score - 1
                title = "Wrong"
                message = "Thats the flag of \(countries[sender.tag].capitalized)"
            }
            
            let ac = UIAlertController(title: title, message: message , preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Next Question", style: .default, handler: askQuestion))
            present(ac, animated: true)
            
        } else {
            let ac = UIAlertController(title: "End of the Quiz" , message: "Final Score: \(score)" , preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Reset Quiz", style: .default, handler: resetQuestions))
            present(ac, animated: true)
        }
    
    }
}

