//
//  MessageCell.swift
//  GroupMessages
//
//  Created by Aaron Ang on 05/11/2018.
//  Copyright © 2018 AaronAng. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var bubbleBackgroundView: UIView!
    
    var ledingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    var chatMessage: ChatMessage! {
        didSet {
            self.messageLabel.text = chatMessage.text
            self.bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .darkGray
            self.messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            
            if chatMessage.isIncoming {
                self.ledingConstraint.isActive = true
                self.trailingConstraint.isActive = false
            } else {
                self.ledingConstraint.isActive = false
                self.trailingConstraint.isActive = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bubbleBackgroundView.layer.cornerRadius = 12
        self.ledingConstraint = self.messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        self.trailingConstraint = self.messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
    }
}
