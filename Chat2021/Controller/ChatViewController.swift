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
    
    @IBOutlet weak var tableView: UITableView!
    
    var messages:[MessageModel] = [MessageModel(sender: "Me", body: "Hello"),
                                  MessageModel(sender: "You", body: "How are you")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ReusableTableViewCell", bundle: nil), forCellReuseIdentifier: K.reusableCell)

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
    
}

//MARK: - Data Sourse extention

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return messages.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let message = messages[indexPath.row]
         
         let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifeir, for: indexPath)
         
         cell.textLabel?.text = message.body
         
         return cell
     }
    
}
