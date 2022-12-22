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
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Fact's about cat's"
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 45)
        return lable
    }()
    
    let factLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.backgroundColor = .lightText
        lable.numberOfLines = 0
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    let lengthLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.backgroundColor = .lightText
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLable)
        addSubview(factLable)
        addSubview(lengthLable)
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
            factLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 50),
            factLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 45),
            factLable.rightAnchor.constraint(equalTo: rightAnchor, constant: -45),
            //factLable.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            lengthLable.topAnchor.constraint(equalTo: factLable.bottomAnchor, constant: 30),
            lengthLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 45),
            lengthLable.rightAnchor.constraint(equalTo: rightAnchor, constant: -45),
            lengthLable.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
