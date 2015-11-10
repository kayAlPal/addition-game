//
//  ViewController.swift
//  L6kalonso
//
//  Created by Kelly Alonso-Palt on 9/21/15.
//  Copyright © 2015 Kelly Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    
    @IBOutlet var easyLabel: UILabel!
    @IBOutlet var easyButton: UIButton!
    
    @IBOutlet var mediumLabel: UILabel!
    @IBOutlet var mediumButton: UIButton!
    
    @IBOutlet var hardLabel: UILabel!
    @IBOutlet var hardButton: UIButton!
    
    @IBOutlet var textField: UITextField!
    
    var theLabels = [UILabel]()

    
    
    var easyOne = 0
    var easyTwo = 0
    var easyAnswer = 0
    var medOne = 0
    var medTwo = 0
    var medAnswer = 0
    var hardOne = 0
    var hardTwo = 0
    var hardAnswer = 0
    
    var possibleAnswer: Int? = 0
    var currentAnswer = 0
    var currentErrors = 0
    
    var userScore = 0
    var currentGoal = 20
    
    var easyRange: UInt32 = 10
    var mediumRange: UInt32 = 20
    var hardRange: UInt32 = 50
    
    
    
    //MARK: Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        easyButton.layer.cornerRadius = 15
        easyButton.layer.borderWidth = 1
        easyButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        startTheGame()
    }
    
    func startTheGame(alert: UIAlertAction! = nil) {
        
        if currentErrors == 4 {
            // add segue
        }
        
        if userScore >= currentGoal {
            easyRange *= 2
            mediumRange *= 2
            hardRange *= 2
            currentGoal += 20
        }
        
        generateNewLabels(easyRange, medium: mediumRange, hard: hardRange)
        
        //textField.delegate = self
        //textField.placeholder = "Type the answer to any of the three questions"
        //textField.becomeFirstResponder()
    }
    
    func generateNewLabels(easy: UInt32, medium: UInt32, hard: UInt32) {
      
        
        easyOne = Int(arc4random_uniform(easy))
        easyTwo = Int(arc4random_uniform(easy))
        easyAnswer = easyOne + easyTwo
        
        easyLabel.text = "\(easyOne) + \(easyTwo)"
        
        medOne = Int(arc4random_uniform(medium))
        medTwo = Int(arc4random_uniform(medium))
        medAnswer = medOne + medTwo
        
        mediumLabel.text = "\(medOne) + \(medTwo)"
        
        hardOne = Int(arc4random_uniform(hard))
        hardTwo = Int(arc4random_uniform(hard))
        hardAnswer = hardOne + hardTwo
        
        hardLabel.text = "\(hardOne) + \(hardTwo)"

    }
    


    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        if let possibleAnswer = Int(textField.text!) {
//            textField.placeholder = "Touch the corresponding square to assign"
//            textField.text = ""
            currentAnswer = possibleAnswer
        }
        else {
            
            startTheGame()
        }
    }
    


   //MARK: Actions
    
    @IBAction func easyButton(sender: UIButton) {
        
        textField.delegate = self
        textField.becomeFirstResponder()
        
        //easyLabel.text = "\(easyOne) + \(easyTwo) = \(currentAnswer)"
        //textField.placeholder = "Touch the corresponding square to assign"
        //textField.text = ""

        if currentAnswer == easyAnswer {
            
            let ac = UIAlertController(title: title, message: "Correct! Your score is \(++userScore).", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: startTheGame))
            presentViewController(ac, animated: true, completion: nil)

        }
            
        else {
            
            let ac = UIAlertController(title: title, message: "Incorrect. You now have \(++currentErrors) errors", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: startTheGame))
            presentViewController(ac, animated: true, completion: nil)
        }
    }

    
    @IBAction func mediumButton(sender: UIButton) {
        
        textField.placeholder = "Touch the corresponding square to assign"
        textField.text = ""

        mediumLabel.text = "\(medOne) + \(medTwo) = \(currentAnswer)"
        
        if currentAnswer == medAnswer {
            
            userScore += 2
            
            let ac = UIAlertController(title: title, message: "Correct! Your score is \(userScore).", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: startTheGame))
            presentViewController(ac, animated: true, completion: nil)
        }
            
        else {
            
            let ac = UIAlertController(title: title, message: "Incorrect", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: startTheGame))
            presentViewController(ac, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func hardButton(sender: UIButton) {
        
        textField.placeholder = "Touch the corresponding square to assign"
        textField.text = ""

        
        hardLabel.text = "\(hardOne) + \(hardTwo) = \(currentAnswer)"
        
        if currentAnswer == hardAnswer {
            
            userScore += 4
            
            let ac = UIAlertController(title: title, message: "Correct! Your score is \(userScore).", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: startTheGame))
            presentViewController(ac, animated: true, completion: nil)
        }
            
        else {
            
            let ac = UIAlertController(title: title, message: "Incorrect", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: startTheGame))
            presentViewController(ac, animated: true, completion: nil)
        }
    }
    
}

