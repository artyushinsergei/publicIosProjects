//
//  ViewController.swift
//  AlbumProject
//
//  Created by SERGEI on 26.06.2022.
//

import UIKit

class AuthViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loginLable: UILabel = {
        let lable = UILabel()
        lable.text = "LogIn"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Enter ur email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Enter ur password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let singInButton: UIButton = {
        let button = UIButton()
        button.setTitle("SingIn", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(singInButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let singUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SingUp", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(singUpButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var textFieldStackView = UIStackView()
    private var buttonsStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupDelegate()
        setConstrains()
    
    }
    //Расположение элементов на стратовом экране
    private func setupView(){
        title = "SingIn"
        view.backgroundColor = .white
        
        // Стак с полями ввода
        textFieldStackView = UIStackView(arrangedSubViews: [emailTextField,passwordTextField],axis: .vertical, spasing: 10, distribution: .fillProportionally)
        
        // Стак с кнопками
        buttonsStackView = UIStackView(arrangedSubViews: [singUpButton,singInButton], axis: .horizontal, spasing: 10, distribution: .fillProportionally)
        
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundView)
        backgroundView.addSubview(textFieldStackView)
        backgroundView.addSubview(loginLable)
        backgroundView.addSubview(buttonsStackView)
    }
    
    // Нажначение для делегатов
    private func setupDelegate(){
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    // MARK: press singIn
    @objc private func singInButtonTapped(){
        print("SingIn is toched")
    }
    
    // MARK: press singUp
    @objc private func singUpButtonTapped(){
        
        self.present(SingUpViewController, animated: true, completion: nil)
    }


}

// MARK: UITextFieldDelegate
extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}

// MARK: setConstrains
extension AuthViewController {
    private func setConstrains(){
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            backgroundView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgroundView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backgroundView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            backgroundView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            loginLable.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            loginLable.bottomAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            singUpButton.heightAnchor.constraint(equalToConstant: 40),
            singInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            buttonsStackView.topAnchor.constraint(equalTo: textFieldStackView.topAnchor, constant: 30),
            buttonsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
        ])
    }
}
