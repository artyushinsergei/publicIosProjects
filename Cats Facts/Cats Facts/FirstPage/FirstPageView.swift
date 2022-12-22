//
//  File.swift
//  Cats Facts
//
//  Created by SERGEI on 13.12.2022.
//

import Foundation
import UIKit



class FirstPageView: UIView {
    private let titleLable: UILabel = {
        let lable = UILabel()
        lable.text = "Info about cat's"
        lable.textColor = .green
        lable.font = UIFont.systemFont(ofSize: 45)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    let firstButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.sizeToFit()
        button.setTitle("Random fact", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.sizeToFit()
        button.setTitle("List of the facts", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(titleLable)
        addSubview(firstButton)
        addSubview(secondButton)
        setConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: setConfigure
extension FirstPageView {
    private func setConfigure(){
        backgroundColor = .white
        setConstraints()
    }
}

// MARK: setConstraints
extension FirstPageView{
    private func setConstraints(){
        NSLayoutConstraint.activate([
            titleLable.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLable.topAnchor.constraint(equalTo: topAnchor, constant: 130)
        ])
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 30),
            firstButton.heightAnchor.constraint(equalToConstant: 30),
            firstButton.widthAnchor.constraint(equalToConstant: 150)
        ])

        NSLayoutConstraint.activate([
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 15),
            secondButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            secondButton.heightAnchor.constraint(equalToConstant: 30),
            secondButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
