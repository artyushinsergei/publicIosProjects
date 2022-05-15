//
//  String + Extansions.swift
//  MailSender
//
//  Created by SERGEI on 12.05.2022.
//

import Foundation

extension String{
    func isValid() -> Bool{
        let format = "SELF MATCHES %@"
        //Регулярное выражение для определения формата строки
        let regEx = "[a-zA-Z0-9._]+@[a-zA-Z]+\\.[a-zA-Z]{2,}"
        return NSPredicate(format: format, regEx).evaluate(with: self)
         
    }
}
