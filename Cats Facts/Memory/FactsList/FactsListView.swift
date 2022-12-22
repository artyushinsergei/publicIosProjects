//
//  FactsListView.swift
//  Cats Facts
//
//  Created by SERGEI on 22.12.2022.
//

import UIKit

class FactsListView: UIView {
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "List of cat's facts"
        label.font = UIFont.systemFont(ofSize: 45)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let maxLength: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter max length of facts"
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let amountResults: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter amount of facts"
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: setupView
extension FactsListView{
    private func setupView(){
        addSubview(title)
        addSubview(maxLength)
        addSubview(amountResults)
        
    }
}

// MARK: setConstraints
extension FactsListView {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 130),
            title.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            maxLength.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 30),
            maxLength.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            maxLength.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
        ])
    }
}
