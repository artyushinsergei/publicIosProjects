//
//  AddViewController.swift
//  NoText
//
//  Created by SERGEI on 30.03.2022.
//

import UIKit


class AddViewController: UIViewController {

    var saveButton = UIButton()
    var titleText = UITextField()
    var titleLable = UILabel()
    var mainTextLable = UILabel()
    var mainText = UITextView
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Note form"
        
        mainTextLableFunc()
        saveButtonFunc()
        titleTextFieldFunc()
        titleLebleFunc()
    }
    

    //MARK: Тайтл Лабл
    func titleLebleFunc(){
        titleLable.frame = CGRect(x: 25, y: 120, width: 350, height: 25)
        titleLable.text = "Note title"
        titleLable.font = UIFont.boldSystemFont(ofSize: 30)
        //titleLable.font.withSize(30.0)
        
        titleLable.textAlignment = .left
        titleLable.textColor = UIColor.green
        //Выровнять по середине
        view.addSubview(titleLable)
        
    }

    //MARK: Поле ввода заголовка
    func titleTextFieldFunc(){
        titleText.frame = CGRect(x: 12, y: 155, width: 350, height: 28)
        titleText.placeholder = " Enter the title"
        titleText.textColor = UIColor.green
        titleText.font = UIFont.boldSystemFont(ofSize: 20)
        titleText.layer.cornerRadius = 5
        titleText.layer.borderWidth = 1
        titleText.layer.borderColor = CIColor.magenta
        //titleText.layer.borderColor = UIColor.lightGray.cgColor
        
        view.addSubview(titleText)
        
    }
    
    //MARK: Мэин Лабл
    func mainTextLableFunc(){
        mainTextLable.frame = CGRect(x: 25, y: 195, width: 350, height: 28)
        mainTextLable.text = "Main text"
        mainTextLable.font = UIFont.boldSystemFont(ofSize: 30)
        mainTextLable.textAlignment = .left
        mainTextLable.textColor = UIColor.green
        //Выровнять по середине
        view.addSubview(mainTextLable)
        
    }
    
    func mainTextFunc(){
        
    }
    
    //MARK: Кнопка сохранить
    func saveButtonFunc(){
        saveButton.frame = CGRect(x: 12, y: 665 , width: 350, height: 45)
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.green, for: .normal)
        saveButton.tintColor = UIColor.green
        saveButton.backgroundColor = .clear
        saveButton.layer.cornerRadius = 5
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.green.cgColor
        saveButton.addTarget(self, action: #selector(onClickSaveButton(paramSender:)), for: .touchUpInside)
        view.addSubview(saveButton)
    }
    
    //MARK: Действие по нажатию кнопки
    @objc func onClickSaveButton(paramSender: Any){
        print("Button is pressed")
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
