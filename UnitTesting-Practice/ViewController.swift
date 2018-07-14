//
//  ViewController.swift
//  UnitTesting-Practice
//
//  Created by malikj on 14/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let untestableObj = OnboardingState()
        let shouldShowAlert = untestableObj.shouldShowEnableLocationAlert()
        if shouldShowAlert == true {
            print("show alert")
        }
        else {
            print("no alert")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

