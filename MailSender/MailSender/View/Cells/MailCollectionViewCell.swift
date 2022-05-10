//
//  MailCollectionViewCell.swift
//  MailSender
//
//  Created by SERGEI on 10.05.2022.
//

import Foundation
import UIKit

class MailCollectionViewCell: UICollectionViewCell{
    
    private let domainLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Apple SD Gothic Neo", size: 16)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        contentView.backgroundColor = .white
        contentView.alpha = 0.5
        contentView.layer.cornerRadius = 10
        addSubview(domainLable)
    }
    
}

extension MailCollectionViewCell{
    private func setConstrains() {
        NSLayoutConstraint.activate([
            domainLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            domainLable.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
