//
//  File.swift
//  Memory
//
//  Created by SERGEI on 13.12.2022.
//

import Foundation
import UIKit


class FirstPageView: UIView {
    private let titleLable: UILabel = {
        let lable = UILabel()
        lable.text = "Bible"
        lable.textColor = .yellow
        lable.font = UIFont.boldSystemFont(ofSize: 80)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let firstButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let thirdButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        backgroundColor = .lightText
        addSubview(titleLable)
        addSubview(firstButton)
        addSubview(secondButton)
        addSubview(thirdButton)
        setConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConfigure(){
        firstButton.setTitle("First Button", for: .normal)
        secondButton.setTitle("Second Button", for: .normal)
        thirdButton.setTitle("Thierd Button", for: .normal)
        setConstrains()
    }
}

extension FirstPageView{
    private func setConstrains(){
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
        
        NSLayoutConstraint.activate([
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 15),
            thirdButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            thirdButton.heightAnchor.constraint(equalToConstant: 30),
            thirdButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
