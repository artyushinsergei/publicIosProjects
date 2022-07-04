//
//  SingUpViewController.swift
//  AlbumProject
//
//  Created by SERGEI on 26.06.2022.
//

import Foundation
import UIKit

class SingUpViewController: UIViewController{
    
    private let scrollView: UIScrollView = {
       let view = UIScrollView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backgdoundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let registrationLable: UILabel = {
        let lable = UILabel()
        lable.text = "Registration"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let firstNameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Ur name"
        return tf
    }()
    
    private let firstNameValidationLable: UILabel = {
        let lable = UILabel()
        lable.text = "Required field"
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let seconNameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Ur secon name"
        return tf
    }()
    
    private let secondNameValidationLable: UILabel = {
        let lable = UILabel()
        lable.text = "Required field"
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let ageValidateLable: UILabel = {
        let lable = UILabel()
        lable.text = "Required field"
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Ur phone number"
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private let phoneValidateLable: UILabel = {
        let lable = UILabel()
        lable.text = "Required field"
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Ur email"
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private let emailValidateLable: UILabel = {
        let lable = UILabel()
        lable.text = "Required field"
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Ur password"
        tf.isSecureTextEntry = true
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private let passwordValidateLable: UILabel = {
        let lable = UILabel()
        lable.text = "Required field"
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let singUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sing Up", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
    
    private var elementStackView = UIStackView()
    private let datePicker = UIDatePicker()
    
    
    override func viewDidLoad() {
        
        setupView()
        
    }
    // MARK: SetupView
    private func setupView(){
        title = "Sing Up"
        
        view.addSubview(scrollView)
        scrollView.addSubview(backgdoundView)
        
        elementStackView = UIStackView(arrangedSubViews: [firstNameTextField,firstNameValidationLable,seconNameTextField,secondNameValidationLable,datePicker,ageValidateLable,phoneTextField,phoneValidateLable,emailTextField,emailValidateLable,passwordTextField,passwordValidateLable], axis: .vertical, spasing: 10, distribution: .fillProportionally)
        backgdoundView.addSubview(elementStackView)
        backgdoundView.addSubview(registrationLable)
        backgdoundView.addSubview(singUpButton)
    }
    //MARK: Delegats
    private func setUpDelegate(){
        firstNameTextField.delegate = self
        seconNameTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setupDatePicker(){
        datePicker.datePickerMode = .date
        datePicker.tintColor = .black
        datePicker.backgroundColor = .white
        datePicker.layer.borderWidth = 1
        datePicker.layer.borderColor = CGColor.init(gray: 20, alpha: 0)
        datePicker.layer.cornerRadius = 6
        datePicker.clipsToBounds = true
        
        
    }
    
}

extension SingUpViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        firstNameTextField.resignFirstResponder()
        seconNameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
}

// MARK: setConstrains
extension SingUpViewController{
    
    private func setConstrains(){
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            backgdoundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgdoundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backgdoundView.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
            backgdoundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        
        NSLayoutConstraint.activate([
            elementStackView.centerXAnchor.constraint(equalTo: backgdoundView.centerXAnchor),
            elementStackView.centerYAnchor.constraint(equalTo: backgdoundView.centerYAnchor),
            elementStackView.leadingAnchor.constraint(equalTo: backgdoundView.leadingAnchor, constant: 20),
            elementStackView.trailingAnchor.constraint(equalTo: backgdoundView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            registrationLable.centerXAnchor.constraint(equalTo: backgdoundView.centerXAnchor),
            registrationLable.bottomAnchor.constraint(equalTo: elementStackView.topAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            singUpButton.centerXAnchor.constraint(equalTo: backgdoundView.centerXAnchor),
            singUpButton.topAnchor.constraint(equalTo: elementStackView.bottomAnchor, constant: 30),
            singUpButton.heightAnchor.constraint(equalToConstant: 40),
            singUpButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
}
