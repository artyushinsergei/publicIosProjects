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
        registerKeybordNotification()
    }
    
    //MARK: Удаление observer-ов для registerKeybordNotification
    deinit{
        registerKeybordNotification()
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
    
    // Назначение для делегатов
    private func setupDelegate(){
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: press singIn
    @objc private func singInButtonTapped(){
        let navVC = UINavigationController(rootViewController: AlbumViewController())
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
    }
    
    // MARK: press singUp
    @objc private func singUpButtonTapped(){
        let singUpViewController = SingUpViewController()
        self.present(singUpViewController, animated: true)
    }
}

// MARK: Observer-ы для сдвижения view при открытие клавиатуры
extension AuthViewController{
    
    private func registerKeybordNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(keybordWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keybordWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeybordNofication(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    @objc private func keybordWillShow(notification: Notification){
        let userInfo = notification.userInfo
        let keybordHeigth = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: keybordHeigth.height / 2)
    }
    
    @objc private func keybordWillHide(notification: Notification){
        scrollView.contentOffset = CGPoint.zero
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
            backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor),
            backgroundView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textFieldStackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            textFieldStackView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            textFieldStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            textFieldStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            loginLable.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            loginLable.bottomAnchor.constraint(equalTo: textFieldStackView.topAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            singUpButton.heightAnchor.constraint(equalToConstant: 40),
            singInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            buttonsStackView.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 30),
            buttonsStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -20)
        ])
    }
}
