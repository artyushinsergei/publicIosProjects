//
//  ViewController.swift
//  NoText
//
//  Created by SERGEI on 18.03.2022.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: Outlet
    
    // Метод init для выделения памятb
    
    //MARK: VCMethods
    // Метод для загрузки всех view
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    // Метод для вызова всего подряд после завершения загрузки VC
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    // View начинает появляться
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    // View заканчивает появляться
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    //MARK: Actions
    @IBAction func onClickInfoButton(_ sender: Any) {
    
        self.infoAlert(title: "Info", message: "This application created like a pet project", style: .alert)
        
    }

    //Функция для кнопки Info
    func infoAlert(title: String, message: String, style: UIAlertController.Style){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok and Cancel", style: .default)/*{(action) in
            let text = alertController.textFields?.first?.text
            print(text ?? "nil text")
        }
        alertController.addTextField { textField in
            textField.placeholder = "Enter ur text"
        }*/
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    

    
}

