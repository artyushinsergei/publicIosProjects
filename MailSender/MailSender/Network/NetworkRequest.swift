//
//  NetworkRequest.swift
//  MailSender
//
//  Created by SERGEI on 22.05.2022.
//

import Foundation
import UIKit

class NetworkRequest{
    
    static let shared = NetworkRequest()
    private init(){}
    
    func requestData(verifalableMail: String, completion: @escaping(Result<Data,Error>) -> Void){
        let urlString = "STROKA"
    
    guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) {data, response,error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {return}
                completion(.success(data))
            }
        }
        .resume()
    }
                                   
}
