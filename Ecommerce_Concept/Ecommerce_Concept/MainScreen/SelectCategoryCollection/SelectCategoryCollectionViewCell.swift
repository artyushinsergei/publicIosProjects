//
//  SelectCategoryCollectionViewCell.swift
//  Ecommerce_Concept
//
//  Created by SERGEI on 09.01.2023.
//

import UIKit

class SelectCategoryCollectionViewCell: UICollectionViewCell {
    private let cellImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let cellTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "Mark Pro", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: setupView
extension SelectCategoryCollectionViewCell {
    private func setupView(){
        addSubview(cellImage)
        addSubview(cellTitle)
    }
}

// MARK: setupConstraints
extension SelectCategoryCollectionViewCell {
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            cellImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cellTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            cellTitle.topAnchor.constraint(equalTo: cellImage.bottomAnchor)
            
        ])
        
    }
}
