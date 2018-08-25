//
//  ViewController.swift
//  Runner
//
//  Created by Teerasej Jiraphatchandej on 8/24/18.
//  Copyright © 2018 The Chromium Authors. All rights reserved.
//

import Foundation
import UIKit
import Intents  

class ViewController: FlutterViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        registerSiriShortcut()
    }
    
    
    func registerSiriShortcut(){
        let activity = NSUserActivity(activityType: "th.in.nextflow.whatToEat.random-meal")
        activity.title = "Show me a meal"
        activity.userInfo = ["Key" : "Value"]
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        activity.suggestedInvocationPhrase = "กินอะไรดี"
        //    activity.persistentIdentifier = NSUserActivityPersistentIdentifier(rawValue:"th.in.nextflow.whatToEat.random_meal")
        view.userActivity = activity
        activity.becomeCurrent();
        
    }
    
    
}


