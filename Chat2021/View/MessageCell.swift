//
//  MessageCell.swift
//  Chat2021
//
//  Created by Konstantin Dmitrievskiy on 07.02.2021.
//  Copyright © 2021 Konstantin Dmitrievskiy. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var barberImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
