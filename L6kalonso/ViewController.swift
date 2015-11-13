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
    
    var highScoreFromUserTableView: Int? {
        didSet {
            if let currentHighScore = highScoreFromUserTableView {
                if currentHighScore < userScore {
                    highScoreFromUserTableView = userScore
                }
            }
        }
    }
    
    @IBOutlet var easyLabel: UILabel!
    @IBOutlet var easyButton: UIButton!
    
    @IBOutlet var mediumLabel: UILabel!
    @IBOutlet var mediumButton: UIButton!
    
    @IBOutlet var hardLabel: UILabel!
    @IBOutlet var hardButton: UIButton!
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var textFieldLabel: UILabel!
    
    var theLabels = [UILabel]()
    var theButtons = [UIButton]()

    @IBOutlet var currentScoreLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    
    
    var easyOne = 0
    var easyTwo = 0
    var easyAnswer = 0
    var medOne = 0
    var medTwo = 0
    var medAnswer = 0
    var hardOne = 0
    var hardTwo = 0
    var hardAnswer = 0
    var theAnswer = 0
    
    //var possibleAnswer: Int? = 0
    var currentAnswer = 0
    var currentErrors = 0
    var newPoints = 0
    
    
    var userScore = 0
    var currentGoal = 20
    
    var easyRange: UInt32 = 10
    var mediumRange: UInt32 = 20
    var hardRange: UInt32 = 50
    
    
    
    //MARK: Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theButtons.append(easyButton)
        theButtons.append(mediumButton)
        theButtons.append(hardButton)
        
        for button in theButtons {
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.grayColor().CGColor
        }
        
        startTheGame()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func startTheGame(alert: UIAlertAction! = nil) {
        
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
        checkAnswer()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        if let possibleAnswer = Int(textField.text!) {
            currentAnswer = possibleAnswer
        }
        else {
            
            startTheGame()
        }
    }
    


   //MARK: Actions
    
    
    
    @IBAction func callTheTextField(sender: UIButton) {
        if sender.tag == 1{
            theAnswer = easyAnswer
            newPoints = 1
            textFieldLabel.text = easyLabel.text
        } else if sender.tag == 2{
            theAnswer = medAnswer
            newPoints = 2
            textFieldLabel.text = mediumLabel.text
        } else {
            theAnswer = hardAnswer
            newPoints = 4
            textFieldLabel.text = hardLabel.text
        }
        textField.delegate = self
        textField.becomeFirstResponder()
        return
    }
    
    
    func checkAnswer() {
    
        if currentAnswer == theAnswer {
            
            userScore += newPoints
            let ac = UIAlertController(title: title, message: "Correct! Your score is \(userScore).", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: startTheGame))
            presentViewController(ac, animated: true, completion: nil)

        }
            
        else {
            //textFieldLabel.text = "\(theAnswer)"
            let ac = UIAlertController(title: title, message: "Incorrect. \(textFieldLabel.text!) = \(theAnswer) not \(currentAnswer). \nErrors: \(++currentErrors)", preferredStyle: .Alert)
            if currentErrors < 4 {
                ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: startTheGame))
            } else {
                ac.addAction(UIAlertAction(title: "Stats", style: .Default, handler: segueToGoodbye))
            }
            presentViewController(ac, animated: true, completion: nil)
        }
        textField.text = ""
        textFieldLabel.text = ""
        currentScoreLabel.text = "\(userScore)"
        errorLabel.text = "\(currentErrors)"
    }
    
    func segueToGoodbye(alert: UIAlertAction! = nil) {
        
       // let destVC = UIStoryboardSegue. as! GoodbyeViewController
        
        
    }


    
}

