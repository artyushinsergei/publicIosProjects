//
//  ViewController.swift
//  MailSender
//
//  Created by SERGEI on 03.05.2022.
//

import UIKit

class VerificationViewController: UIViewController {
    
    private let background : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "background.jpg")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let statusLable = StatusLable()
    private let mailTextField = MailTextField()
    private let verificationButton = VerificationButton()
    private let collectionView = MailsCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private lazy var stackView = UIStackView(arrangedSubviews: [mailTextField,verificationButton,collectionView], axis: .vertical, spacing: 20)

    override func viewDidLoad() {
        super.viewDidLoad()

        //view.backgroundColor = UIColor.red
        setupViews()
        setDelegates()
        setConstrains()
    }
    
    private func setupViews(){
        view.addSubview(background)
        view.addSubview(statusLable)
        view.addSubview(stackView)

    }
    
    private func setDelegates(){
        collectionView.dataSource = self
        collectionView.selectMailDelegate = self
    }


}

extension VerificationViewController: SelectProposedMailProtocol{
    func selectProposedMail(indexPath: IndexPath) {
        print(indexPath)
    }
    
    
}

//MARK: - SetConstrains

extension VerificationViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell.idMailCell.rawValue, for: indexPath) as? MailCollectionViewCell
        else {
            return UICollectionViewCell()
            
        }
        return cell
    }
    
    
}

extension VerificationViewController{
    private func setConstrains(){
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor,constant: 0),
            background.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            statusLable.topAnchor.constraint(equalTo: view.topAnchor,constant: 300),
            statusLable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            statusLable.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            mailTextField.heightAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: statusLable.bottomAnchor, constant: 2),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            
        ])
    }
}
 
