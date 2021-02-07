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
    
    let db = Firestore.firestore()
    
    var messages:[MessageModel] = [MessageModel(sender: "Me", body: "Hello"),
                                  MessageModel(sender: "You", body: "How are you")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageView.layer.cornerRadius = messageView.frame.size.height / 3.5
        
        myTableView.dataSource = self
        
        myTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: K.reusableCell)

        navigationItem.hidesBackButton = true
        
        loadMessages()
        
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
        
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection("messages").addDocument(data: [
                "sender" : messageSender,
                "body" : messageBody,
                "date": Date().timeIntervalSince1970]) { (error) in
                    if let e = error {
                        print("There was an issue saving data to firestore, \(e)")
                               } else {
                                   DispatchQueue.main.async {
                                       self.messageTextField.text = ""
                    }
                }
            }
        }
    }
    
    func loadMessages() {
        
        db.collection("messages").order(by: "date").addSnapshotListener() { (querySnapshot, err) in
            
            self.messages = []
            
            if let e = err {
                
                print("We have problem with retriving data \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    
                    for doc in snapshotDocuments {
                        
                        let data = doc.data()
                        
                        if let messageSender = data["sender"] as? String, let messageBody = data["body"] as? String {
                            let newMessage = MessageModel(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.myTableView.reloadData()
                            }
                        }
                    }
                }
            }
            
        }
        
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
        
        if message.sender == Auth.auth().currentUser?.email {
            
            cell.custumerImageView.isHidden = true
            cell.barberImageView.isHidden = false
            cell.messageView.backgroundColor = #colorLiteral(red: 0.1647058824, green: 0.831372549, blue: 1, alpha: 1)
            cell.messageLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } else {
            
            cell.custumerImageView.isHidden = false
            cell.barberImageView.isHidden = true
            cell.messageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.messageLabel.textColor = #colorLiteral(red: 1, green: 0, blue: 0.8196078431, alpha: 1)
            
        }
        
        return cell
    }
    
}
