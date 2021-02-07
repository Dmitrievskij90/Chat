//
//  ChatViewController.swift
//  Chat2021
//
//  Created by Konstantin Dmitrievskiy on 03.02.2021.
//  Copyright © 2021 Konstantin Dmitrievskiy. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var messageView: UIView!
    
    var messages:[MessageModel] = [MessageModel(sender: "Me", body: "Hello"),
                                  MessageModel(sender: "You", body: "How are you")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageView.layer.cornerRadius = messageView.frame.size.height / 3.5
        
        myTableView.dataSource = self
        
        myTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: K.reusableCell)

        navigationItem.hidesBackButton = true
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
    }
    
    
}

//MARK: - Data Sourse extention

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.reusableCell, for: indexPath) as! MessageCell
        
        cell.messageLabel.text = message.body
        
        return cell
    }
    
}
