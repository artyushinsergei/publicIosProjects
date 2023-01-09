//
//  ViewController.swift
//  Ecommerce_Concept
//
//  Created by SERGEI on 04.01.2023.
//

import UIKit

class MainViewController: UINavigationController {
 
    private let mainView = MainView()
    
    private var selectCatehoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstrains()
        setConfigure()
    }

}

//MARK: setupView
extension MainViewController {
    private func setupView(){
        view.addSubview(mainView)
        view.addSubview(navigationBar)
        
    }
}

// MARK: setConfigure
extension MainViewController {
    private func setConfigure(){
        navigationBar.barTintColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        navigationBar.topItem?.title = "Text"
        navigationBar.isTranslucent = false

        setConfigureCollectionView()
    }
}

// MARK: setConstrains
extension MainViewController {
    private func setConstrains(){
        //selectCategoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            mainView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mainView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
}
}

// MARKL: setConfigureCollectionView
//extension MainViewController: UICollectionViewDataSource {
//    private func setConfigureCollectionView(){
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = .init(width: 71, height: 71)
//        layout.minimumLineSpacing = 10
//        layout.scrollDirection = .horizontal
//
//        selectCatehoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        selectCatehoryCollectionView.register(SelectCategoryCollectionViewCell.self, forCellWithReuseIdentifier: "SelectCategoryCollectionViewCell")
//        selectCatehoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        selectCatehoryCollectionView.dataSource = self
//        view.addSubview(selectCatehoryCollectionView)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = selectCatehoryCollectionView.dequeueReusableCell(withReuseIdentifier: "SelectCategoryCollectionViewCell", for: indexPath) as? SelectCategoryCollectionViewCell else { return UICollectionViewCell() }
//
//        cell.layer.shadowRadius = 4
//        cell.layer.shadowOffset = .zero
//        cell.layer.shadowOpacity = 0.04
//        cell.layer.shadowColor = .
//        cell.layer.cornerRadius = 15
//
//        return cell
//    }
//
//    private func setCollectionConstraints(){
//        NSLayoutConstraint.activate([
//            selectCatehoryCollectionView.topAnchor.constraint(equalTo: mainView.topAnchor),
//            selectCatehoryCollectionView.leftAnchor.constraint(equalTo: mainView.leftAnchor),
//            selectCatehoryCollectionView.rightAnchor.constraint(equalTo: mainView.rightAnchor),
//            selectCatehoryCollectionView.heightAnchor.constraint(equalToConstant: 100)
//
//        ])
//    }
//}
