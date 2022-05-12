//
//  StatusLable.swift
//  MailSender
//
//  Created by SERGEI on 03.05.2022.
//

import Foundation
import UIKit

class StatusLable: UILabel{

    //Наблюдатель didSet для изменения параметра text
    public var isValid  = false {
        didSet{
            if self.isValid{
                setValidSetings()
            }else{
                setNotValidSetings()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        text = "Check ur mail"
        textColor = UIColor.cyan
        font = UIFont(name: "San Francisco", size: 16)
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setNotValidSetings(){
        text = "Mail is not valid. Example: name@domain.ru"
        textColor = .red
    }
    
    private func setValidSetings(){
        text = "Mail is valid"
        textColor = .green
    }
}
