//
//  ViewController.swift
//  Ecommerce_Concept
//
//  Created by SERGEI on 04.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    

    
    //private let selectCategoryCollectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstrains()
    }

}

extension MainViewController {
    private func setupView(){
        view.addSubview(mainView)
        //view.addSubview(selectCategoryCollectionView)
        
    }
}

extension MainViewController {
    private func setConstrains(){
        //selectCategoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
}
}
