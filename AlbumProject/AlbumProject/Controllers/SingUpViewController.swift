//
//  SingUpViewController.swift
//  AlbumProject
//
//  Created by SERGEI on 26.06.2022.
//

import Foundation
import UIKit

class SingUpViewController: UIViewController, UITextFieldDelegate{
    
    private let scrollView: UIScrollView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
        lable.font = UIFont.systemFontSize(14)
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
        lable.font = UIFont.systemFontSize(14)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let ageValidateLable: UILabel = {
        let lable = UILabel()
        lable.text = "Required field"
        lable.font = UIFont.systemFontSize(14)
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
        lable.font = UIFont.systemFontSize(14)
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
        lable.font = UIFont.systemFontSize(14)
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
        lable.font = UIFont.systemFontSize(14)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let singUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sing Up", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 10
        
        
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
        
    }
    
}
