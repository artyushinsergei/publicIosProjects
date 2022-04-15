//
//  Bithday.swift
//  BithdayTracker
//
//  Created by SERGEI on 11.04.2022.
//

import Foundation

class Birthday{
    let firstName : String
    let lastName : String
    let birthdate : Date
    
    init(firstName:String, lastName:String, birthDate:Date){
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthDate
        
    }
}
