//
//  FactsListViewController.swift
//  Cats Facts
//
//  Created by SERGEI on 22.12.2022.
//

import UIKit

class FactsListViewController: UIViewController {
    
    private let factsListView = FactsListView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstraints()
    }

}

extension FactsListViewController {
    private func setupView(){
        view.addSubview(factsListView)
        view.backgroundColor = .white
    }
    
}

extension FactsListViewController{
    private func setConstraints(){
        factsListView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            factsListView.topAnchor.constraint(equalTo: view.topAnchor),
            factsListView.leftAnchor.constraint(equalTo: view.leftAnchor),
            factsListView.rightAnchor.constraint(equalTo: view.rightAnchor),
            factsListView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
