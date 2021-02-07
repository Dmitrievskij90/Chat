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
    
    let welcomeText = K.welcomeText
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.layer.cornerRadius = loginView.frame.size.height / 3
        registerView.layer.cornerRadius = registerView.frame.size.height / 3
        
        let label = LTMorphingLabel()//(frame: CGRect(x: 220, y: 440, width: 140, height: 200))
        
        view.addSubview(label)
        
        setLabel(label: label)
        
//        for letter in welcomeText {
//
//            Timer.scheduledTimer(withTimeInterval: 0.05 * charIndex, repeats: false) { (timer) in
//
//                label.text?.append(letter)
//            }
//            charIndex += 1
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func registerTapped(_ sender: UIButton) {
    }
    
  
    @IBAction func loginTapped(_ sender: Any) {
    }
    
    func setLabel(label: LTMorphingLabel) {
        
        label.text = welcomeText
        label.font = UIFont(name:"Baskerville", size: 29.0)
        label.textAlignment = .center
        
        label.morphingEffect = .anvil
        label.morphingEnabled = true
        label.morphingDuration = 1
        label.morphingCharacterDelay = 0.5
        label.start()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
//      label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    

}

