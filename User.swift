//
//  User.swift
//  L6kalonso
//
//  Created by Kelly Alonso-Palt on 11/11/15.
//  Copyright © 2015 Kelly Alonso. All rights reserved.
//
import Foundation
import UIKit




class User: NSObject, NSCoding {
    
    //MARK: Properties
    
    struct PropertyKey {
        static let selfieKey = "selfie"
        static let nameKey = "name"
        static let levelKey = "level"
        // static let fewestErrorsKey = "fewestErrors"
        static let isGirlKey = "isGirl"
    }
    
    var defaultImage: UIImage = UIImage(named: "defaultPhoto")!
    var defaultPicBoy: UIImage = UIImage(named: "defaultImageBoy")!
    
    var selfie: UIImage?
    var name: String
    var level: String
    //var fewestErrors: String?
    var isGirl: Bool
    
    enum Gender: Int {
        case Boy = 0, Girl
        
        //        init() {
        //            self = .Boy
        //        }
    }
    
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("theUsers")
    
    
    
    //MARK: Initialization
    
    //    init(newPic: UIImage?, newName: String, Gender: Gender, highestPrime: String){
    //
    //        selfie = newPic
    //        name = newName
    //        self.Gender = Gender.rawValue
    //        self.
    //        level = highestPrime
    //        isGirl = false
    //
    //    }
    
    init(newPic: UIImage?, newName: String, girl: Bool, highScore: String?) {
        if let thisPic = newPic {
            self.selfie = thisPic
            
            if girl {
                self.isGirl = true
            } else {
                self.isGirl = false
            }
            
        }
        else if girl {
            self.selfie = defaultImage
            self.isGirl = true
        } else {
            self.selfie = defaultPicBoy
            self.isGirl = false
        }
        
        self.name = newName
        if let existingHighScore = highScore {
            self.level = existingHighScore
        } else {
            self.level = "\(0)"
        }
        //self.fewestErrors = ""
        
        super.init()
    }
    
    //MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(selfie, forKey: PropertyKey.selfieKey)
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(level, forKey: PropertyKey.levelKey)
        //aCoder.encodeObject(fewestErrors, forKey: PropertyKey.fewestErrorsKey)
        aCoder.encodeBool(isGirl, forKey: PropertyKey.isGirlKey)
    }
    
    convenience required init(coder aDecoder: NSCoder) {
        
        let selfie = aDecoder.decodeObjectForKey(PropertyKey.selfieKey) as? UIImage
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let level = aDecoder.decodeObjectForKey(PropertyKey.levelKey) as! String
        //let fewestErrors = aDecoder.decodeObjectForKey(PropertyKey.fewestErrorsKey)
        let isGirl = aDecoder.decodeBoolForKey(PropertyKey.isGirlKey) as Bool
        
        
        self.init(newPic: selfie, newName: name, girl: isGirl, highScore: level)
        
    }
    
    
    
}