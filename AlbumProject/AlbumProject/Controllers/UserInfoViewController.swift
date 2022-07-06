//
//  UserInfoViewController.swift
//  AlbumProject
//
//  Created by SERGEI on 04.07.2022.
//

import Foundation
import UIKit

class UserInfoViewController: UIViewController{
    
    private let firstNameLable: UILabel = {
        let lable = UILabel()
        lable.text = "First name"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let lastNameLable: UILabel = {
        let lable = UILabel()
        lable.text = "Last name"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let ageLable: UILabel = {
        let lable = UILabel()
        lable.text = "Age"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let phoneLable: UILabel = {
        let lable = UILabel()
        lable.text = "Phone"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let emailLable: UILabel = {
        let lable = UILabel()
        lable.text = "E-mail"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let passwordLable: UILabel = {
        let lable = UILabel()
        lable.text = "Password"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private var stackView = UIStackView()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
        
        
    }
     
    private func setupViews(){
        title = "Active user"
        view.backgroundColor = .white
        
        stackView = UIStackView(arrangedSubViews: [firstNameLable,lastNameLable,ageLable,phoneLable,emailLable,passwordLable], axis: .horizontal, spasing: 10, distribution: .fillProportionally)
        
        view.addSubview(stackView)
    }
    
}

extension UserInfoViewController{
    private func setConstrains(){
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
