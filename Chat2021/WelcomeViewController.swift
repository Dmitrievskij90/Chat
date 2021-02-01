//
//  ViewController.swift
//  Chat2021
//
//  Created by Konstantin Dmitrievskiy on 01.02.2021.
//  Copyright © 2021 Konstantin Dmitrievskiy. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var charIndex = 0.0
    
    let welcomeText = "Welcome"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for letter in welcomeText {
            
            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) { (timer) in
                
                self.welcomeLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    

    
  
    
   
    

}

