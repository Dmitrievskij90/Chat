//
//  ViewController.swift
//  Chat2021
//
//  Created by Konstantin Dmitrievskiy on 01.02.2021.
//  Copyright © 2021 Konstantin Dmitrievskiy. All rights reserved.
//

import UIKit
import LTMorphingLabel

class WelcomeViewController: UIViewController {
    
    
    
    var charIndex = 0.0
    
    let welcomeText = "Welcome"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let label = LTMorphingLabel(frame: CGRect(x: 220, y: 440, width: 140, height: 200))
        label.text = welcomeText
        label.font = UIFont(name:"Baskerville", size: 31.0)
        
        view.addSubview(label)
        
        label.center = self.view.center

        label.center.x = self.view.center.x

        label.center.y = self.view.center.y

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        label.morphingEffect = .anvil
        
        label.morphingEnabled = true
        label.morphingDuration = 1
        label.morphingCharacterDelay = 0.5
        label.start()
        
        
//        for letter in welcomeText {
//
//            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) { (timer) in
//
//                self.welcomeLabel.text?.append(letter)
//            }
//            charIndex += 1
//        }
    }
    

    
  
    
   
    

}

