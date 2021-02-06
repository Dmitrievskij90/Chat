//
//  ReusableTableViewCell.swift
//  Chat2021
//
//  Created by Konstantin Dmitrievskiy on 06.02.2021.
//  Copyright © 2021 Konstantin Dmitrievskiy. All rights reserved.
//

import UIKit

class ReusableTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var barberImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      messageView.layer.cornerRadius = messageView.frame.size.height / 3.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
