//
//  AddViewController.swift
//  NoText
//
//  Created by SERGEI on 30.03.2022.
//

import UIKit

class AddViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var noteText: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButtonFunc()
    }
    
    func saveButtonFunc(){
        
        if ((titleText.text?.isEmpty) != nil){
            saveButton.isHidden = true
        }
        
        saveButton.backgroundColor = .clear
        saveButton.layer.cornerRadius = 5
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.green.cgColor
    }
    
    
    
    //MARK: Actions
//    @IBAction func saveButton(_ sender: Any) {
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
