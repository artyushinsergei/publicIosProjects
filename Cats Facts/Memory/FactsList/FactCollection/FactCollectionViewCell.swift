//
//  FactCollectionView.swift
//  Cats Facts
//

//  Created by SERGEI on 24.12.2022.
//

import UIKit

class FactCollectionViewCell: UICollectionViewCell {
    
    private let fact: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let length: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

extension FactCollectionViewCell {
    private func setupView(){
        addSubview(fact)
        addSubview(length)
    }
}

extension FactCollectionViewCell{
    private func setConstraints(){
        NSLayoutConstraint.activate([
            fact.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            fact.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            fact.rightAnchor.constraint(equalTo: rightAnchor,constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            length.topAnchor.constraint(equalTo: fact.bottomAnchor, constant: 5),
            length.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            length.rightAnchor.constraint(equalTo: rightAnchor, constant: -5)
        ])
    }
}
