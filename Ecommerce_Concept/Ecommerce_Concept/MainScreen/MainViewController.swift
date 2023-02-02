//
//  ViewController.swift
//  Ecommerce_Concept
//
//  Created by SERGEI on 04.01.2023.
//

import UIKit

class MainViewController: UINavigationController {
 
    private let upperSelectionSection = UpperSelectionSection()
    
    private var selectCatehoryCollectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstrains()
        setConfigure()
        setCollectionViewConfigure()
    }

}

//MARK: setupView
extension MainViewController {
    private func setupView(){
        view.addSubview(upperSelectionSection)
        view.addSubview(navigationBar)
        view.addSubview(selectCatehoryCollectionView)
        
    }
}

// MARK: setConfigure
extension MainViewController {
    private func setConfigure(){
        navigationBar.barTintColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        navigationBar.topItem?.title = "Text"
        navigationBar.isTranslucent = false       
    }
}

// MARK: setConstrains
extension MainViewController {
    private func setConstrains(){
        //selectCategoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        upperSelectionSection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upperSelectionSection.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            upperSelectionSection.leftAnchor.constraint(equalTo: view.leftAnchor),
            upperSelectionSection.rightAnchor.constraint(equalTo: view.rightAnchor),
            upperSelectionSection.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        selectCatehoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectCatehoryCollectionView.topAnchor.constraint(equalTo: upperSelectionSection.bottomAnchor),
            selectCatehoryCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            selectCatehoryCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            selectCatehoryCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = selectCatehoryCollectionView.dequeueReusableCell(withReuseIdentifier: "SelectCategoryCollectionViewCell", for: indexPath) as? SelectCategoryCollectionViewCell else { return UICollectionViewCell() }
        
        let model = mock[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    private func setCollectionViewConfigure(){
        selectCatehoryCollectionView.backgroundColor = .red
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.itemSize = .init(width: 71, height: 71)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        
        selectCatehoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        selectCatehoryCollectionView.register(SelectCategoryCollectionViewCell.self, forCellWithReuseIdentifier: "SelectCategoryCollectionViewCell")
        
    }
        
}

struct Mock {
    let image: UIImage
    let title: String
}

let mock = [Mock(image: UIImage(systemName: "square.and.arrow.down.on.square.fill")!, title: "Test1"),
            Mock(image: UIImage(systemName: "square.and.arrow.up.on.square")!, title: "Test2"),
Mock(image: UIImage(systemName: "square.and.arrow.down.fill")!, title: "Test3"),
Mock(image: UIImage(systemName: "square.and.arrow.up")!, title: "Test4")]

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
