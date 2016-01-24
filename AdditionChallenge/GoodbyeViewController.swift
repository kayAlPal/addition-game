//
//  GoodbyeViewController.swift
//  AdditionChallenge
//
//  Created by Kelly Alonso-Palt on 11/10/15.
//  Copyright © 2015 Kelly Alonso. All rights reserved.
//

import UIKit

class GoodbyeViewController: UIViewController {

    @IBOutlet var thisGameScoreLabel: UILabel!
    
    @IBOutlet var highScoreLabel: UILabel!
    
    var highScoreFromViewController: Int?  {
        didSet {
            if let theresAHighScore = highScoreFromViewController {
                highScore = "\(theresAHighScore)"
            }
        }
    }

    var userScoreFromViewController: Int?
    var highScore: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let highScore = highScoreFromViewController {
            highScoreLabel.text = "\(highScore)"
        }
        if let currentScore = userScoreFromViewController {
            thisGameScoreLabel.text = "\(currentScore)"
        }
        print(highScoreFromViewController)
        print(userScoreFromViewController)
        print(highScore)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let destVC = segue.destinationViewController as? UserTableViewController {
//            if let thisScore = highScore {
//                destVC.currentUser?.level = thisScore
////                if let thisUser = destVC.currentUser {
////                    thisUser.level = thisScore
//                    print(thisScore)
//               // }
        
//            }
//        }
        
    }


}
