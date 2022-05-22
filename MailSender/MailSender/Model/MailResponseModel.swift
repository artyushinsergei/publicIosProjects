//
//  MailResponseModel.swift
//  MailSender
//
//  Created by SERGEI on 22.05.2022.
//

import Foundation

struct MailResponseModel: Decodable{
    let result: String
    let reason: String
    let did_you_mean: String?
    let success: Bool
    
    var reasonDiscription: String{
        switch reason{
        case "Invalid":
            return "ssss"
        default:
            return "No data"
        }
    }
    
}
