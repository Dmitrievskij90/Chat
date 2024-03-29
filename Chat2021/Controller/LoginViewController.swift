//
//  LoginViewController.swift
//  Chat2021
//
//  Created by Konstantin Dmitrievskiy on 03.02.2021.
//  Copyright © 2021 Konstantin Dmitrievskiy. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var exView: UIView!
    @IBOutlet weak var loInButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exView.layer.cornerRadius = 0.5 * exView.bounds.size.width
        exView.clipsToBounds = true
        
        loInButton.layer.cornerRadius = 0.5 * loInButton.bounds.size.width
        loInButton.clipsToBounds = true
       
    }
    
    @IBAction func logInButtonPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let self = self else { return }
                
                if let e = error {
                    print(e)
                } else {
                    
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
                
            }
        }
    }
    
}
