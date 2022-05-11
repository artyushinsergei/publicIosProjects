//
//  MailTextField.swift
//  MailSender
//
//  Created by SERGEI on 03.05.2022.
//

import UIKit

protocol ActionsMailTextField: AnyObject {
    func typingText(text: String)
    func clearOutTextField()
}

class MailTextField : UITextField{
    
    weak var textFiedlDelegate: ActionsMailTextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .white
        borderStyle = .none
        layer.cornerRadius = 10
        textColor = UIColor.cyan
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        leftViewMode = .always
        clearButtonMode = .always
        returnKeyType = .done
        placeholder = "Enter mail"
        font = UIFont(name: "San Francisco", size: 16)
        tintColor = UIColor.cyan
    }
    
}

extension MailTextField: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else {return true}
        textFiedlDelegate?.typingText(text: text)
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textFiedlDelegate?.clearOutTextField()
        return true
    }
}
