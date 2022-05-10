//
//  MailTextField.swift
//  MailSender
//
//  Created by SERGEI on 03.05.2022.
//

import UIKit

class MailTextField : UITextField{
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .white
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = UIColor.cyan
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        placeholder = "Enter mail"
        font = UIFont(name: "San Francisco", size: 16)
        tintColor = UIColor.cyan
    }
    
}
