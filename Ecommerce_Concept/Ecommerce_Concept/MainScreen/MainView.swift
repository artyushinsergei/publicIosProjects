//
//  MainView.swift
//  Ecommerce_Concept
//
//  Created by SERGEI on 04.01.2023.
//

import UIKit

class MainView: UIView {
    
    private let selectCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Category"
        label.font = UIFont(name: "Mark Pro", size: 25)
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
        stack.backgroundColor = .red
        stack.alignment = .center
        stack.spacing = 10
        stack.distribution = .fill
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
extension MainView{
    private func setupView(){
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        headerHorizontalStack.addArrangedSubview(selectCategoryLabel)
        headerHorizontalStack.addArrangedSubview(viewAllLabel)
        addSubview(headerHorizontalStack)
        
    }
}

// MARK: setConstraints
extension MainView{
    private func setConstraints(){
        NSLayoutConstraint.activate([
            headerHorizontalStack.topAnchor.constraint(equalTo: topAnchor),
            headerHorizontalStack.leftAnchor.constraint(equalTo: leftAnchor),
            headerHorizontalStack.rightAnchor.constraint(equalTo: rightAnchor),
            headerHorizontalStack.heightAnchor.constraint(equalToConstant: 100)
        ])
        
    }
}
