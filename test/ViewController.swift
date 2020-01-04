//
//  ViewController.swift
//  test
//
//  Created by LeoNguyen on 2019-12-30.
//  Copyright © 2019 LeoNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numOfQuestion = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       countries += ["estonia", "france", "germany", "ireland"]
       button1.layer.borderWidth = 1
       button2.layer.borderWidth = 1
       button3.layer.borderWidth = 1
       button1.layer.borderColor = UIColor.gray.cgColor
       button2.layer.borderColor = UIColor.gray.cgColor
       button3.layer.borderColor = UIColor.gray.cgColor
       askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
    button1.setImage(UIImage(named: countries[0]), for: .normal)
    button2.setImage(UIImage(named: countries[1]), for: .normal)
    button3.setImage(UIImage(named: countries[2]), for: .normal)
    title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        numOfQuestion += 1
        if sender.tag == correctAnswer { title = "Correct"
        score += 1
        } else {
        title = "Wrong, that's the flag of \(countries[sender.tag])"
        score -= 1
        }
        if numOfQuestion<5 {
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true) }
        else
        {
        let ac = UIAlertController(title: title, message: "You finished 5 questions, your final score is \(score).", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Start new round", style: .default, handler: askQuestion))
        numOfQuestion = 0
        score = 0
        present(ac, animated: true)
        }
    }
}

