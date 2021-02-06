//
//  RegisterViewController.swift
//  Chat2021
//
//  Created by Konstantin Dmitrievskiy on 03.02.2021.
//  Copyright © 2021 Konstantin Dmitrievskiy. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var exView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailView.layer.cornerRadius = emailView.frame.size.height / 2.5
        passwordView.layer.cornerRadius = passwordView.frame.size.height / 2.5
        
        registerButton.layer.cornerRadius = 0.5 * registerButton.bounds.size.width
        registerButton.clipsToBounds = true
        
        exView.layer.cornerRadius = 0.5 * exView.bounds.size.width
        exView.clipsToBounds = true

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: K.gegisterSegue, sender: self)
                }
            }
        }
    }
    
}
