//
//  StatusLable.swift
//  MailSender
//
//  Created by SERGEI on 03.05.2022.
//

import Foundation
import UIKit

class StatusLable: UILabel{

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        text = "Check ur mail"
        textColor = UIColor.cyan
        font = UIFont(name: "San Francisco", size: 16)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
