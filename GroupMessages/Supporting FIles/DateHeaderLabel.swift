//
//  DateHeaderLabel.swift
//  GroupMessages
//
//  Created by Aaron Ang on 07/11/2018.
//  Copyright © 2018 AaronAng. All rights reserved.
//

import UIKit

class DateHeaderLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        textColor = .white
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        font = UIFont.boldSystemFont(ofSize: 14)
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        return CGSize(width: originalContentSize.width + 16, height: height)
    }
}
