//
//  MainView.swift
//  Ecommerce_Concept
//
//  Created by SERGEI on 04.01.2023.
//

import UIKit

class UpperSelectionSection: UIView {
    
    private let selectCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Category"
        label.font = UIFont(name: "Mark Pro Bold", size: 25)
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let viewAllLabel: UILabel = {
        let label = UILabel()
        label.text = "view all"
        label.font = UIFont(name: "Mark Pro", size: 15)
        label.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        label.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let headerHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
extension UpperSelectionSection{
    private func setupView(){
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        headerHorizontalStack.addArrangedSubview(selectCategoryLabel)
        headerHorizontalStack.addArrangedSubview(viewAllLabel)
        addSubview(headerHorizontalStack)
        
    }
}

// MARK: setConstraints
extension UpperSelectionSection{
    private func setConstraints(){
        NSLayoutConstraint.activate([
            headerHorizontalStack.topAnchor.constraint(equalTo: topAnchor),
            headerHorizontalStack.leftAnchor.constraint(equalTo: leftAnchor, constant: 17),
            headerHorizontalStack.rightAnchor.constraint(equalTo: rightAnchor, constant: -33),
            headerHorizontalStack.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
