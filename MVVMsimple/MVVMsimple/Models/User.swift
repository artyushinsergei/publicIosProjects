//
//  User.swift
//  MVVMsimple
//
//  Created by SERGEI on 03.08.2022.
//

import Foundation

struct User{
    let login: String?
    let password: String
}

extension User{
    static var logins = [
        User(login: "user", password: "123")
    ]
}
