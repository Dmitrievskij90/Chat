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
    
    @IBOutlet weak var welcomeLAbel: UILabel!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var registerView: UIView!
    
    var charIndex = 0.0
    
    let welcomeText = "Welcome"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.layer.cornerRadius = loginView.frame.size.height / 3
        registerView.layer.cornerRadius = registerView.frame.size.height / 3
        
        let label = LTMorphingLabel()//(frame: CGRect(x: 220, y: 440, width: 140, height: 200))
        label.text = welcomeText
        label.font = UIFont(name:"Baskerville", size: 29.0)
        label.textAlignment = .center
        
        label.morphingEffect = .anvil
        label.morphingEnabled = true
        label.morphingDuration = 1
        label.morphingCharacterDelay = 0.5
        label.start()
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false

//        NSLayoutConstraint.activate([
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
//        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        ])
        
//        let buttonView = UIView()
//        buttonView.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
//        view.addSubview(buttonView)
//
//        buttonView.translatesAutoresizingMaskIntoConstraints = false
//        buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        buttonView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100).isActive = true
////        buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
////        buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30).isActive = true
//
//        buttonView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        buttonView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
//        for letter in welcomeText {
//
//            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) { (timer) in
//
//                self.welcomeLabel.text?.append(letter)
//            }
//            charIndex += 1
//        }
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
    }
    
  
    @IBAction func loginTapped(_ sender: Any) {
    }
    
   
    

}

