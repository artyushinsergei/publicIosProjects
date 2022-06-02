//
//  Alert.swift
//  Router
//
//  Created by SERGEI on 26.05.2022.
//

import UIKit

//MARK: Расширение для алерта
extension UIViewController{
    func alertController(title: String,placeHolde: String, complitionHandler: @escaping (String) -> Void){
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ok", style: .default, handler: {(action) in
            let tfText = alertController.textFields?.first
            guard let text = tfText?.text else {return}
            complitionHandler(text)
        })
        
        alertController.addTextField { (tf) in
            tf.placeholder = placeHolde
        }
        
        let alertCancel = UIAlertAction(title: "Cancel", style: .default, handler: {(_) in })
        
        alertController.addAction(alertOk)
        alertController.addAction(alertCancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func alertError(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "ok", style: .default)
        alertController.addAction(alertOk)
        present(alertController, animated: true, completion: nil)
    }
}
