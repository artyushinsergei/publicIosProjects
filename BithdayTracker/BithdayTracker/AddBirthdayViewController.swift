//
//  ViewController.swift
//  BithdayTracker
//
//  Created by SERGEI on 09.04.2022.
//

import UIKit

protocol AddBirthdayViewControllerDelegate{
    func addBirthdayViewController(addBirthdayViewController:AddBirthdayViewController, didAddBirthday birthday: Birthday)
}

class AddBirthdayViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    var delegate : AddBirthdayViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveTapped(_ sender: Any) {
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let birthdate = birthdayPicker.date
        let newBirthday = Birthday(firstName: firstName, lastName: lastName, birthDate: birthdate)
        
        print("Name - \(newBirthday.firstName)")
        print("Lastname - \(newBirthday.lastName)")
        print("Birthdate - \(newBirthday.birthdate)")
        delegate?.addBirthdayViewController(addBirthdayViewController: self, didAddBirthday: newBirthday)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

