//
//  FirstBiblePageView.swift
//  Cats Facts
//
//  Created by SERGEI on 20.12.2022.
//

import Foundation
import UIKit

class FactPageView: UIView {
    
    let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage.init(systemName: "chevron.backward"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fact's about cat's"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 45)
        return label
    }()
    
    let factLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .lightText
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lengthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .lightText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLable)
        addSubview(factLabel)
        addSubview(lengthLabel)
        addSubview(backButton)
        setConstraints()
        
        
    }
       
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: setConstraints
extension FactPageView {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            backButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            titleLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLable.topAnchor.constraint(equalTo: topAnchor, constant: 130)
        
        ])
        
        NSLayoutConstraint.activate([
            factLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 50),
            factLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 45),
            factLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -45),
            //factLabel.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            lengthLabel.topAnchor.constraint(equalTo: factLabel.bottomAnchor, constant: 30),
            lengthLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 45),
            lengthLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -45),
            lengthLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
