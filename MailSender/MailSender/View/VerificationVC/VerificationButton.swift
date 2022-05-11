//
//  VerificationButton.swift
//  MailSender
//
//  Created by SERGEI on 03.05.2022.
//

import Foundation
import UIKit

class VerificationButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = UIColor.gray
        setTitle("Verification Button", for: .normal)
        let color = UIColor.green
        setTitleColor(color, for: .normal)
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Avenir Book", size: 16)
        // isEnabled = false
        alpha = 0.5
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

