//
//  FactsListViewController.swift
//  Cats Facts
//
//  Created by SERGEI on 22.12.2022.
//

import UIKit

class FactsListViewController: UIViewController {
    
    private let factsListView = FactsListView()
    private var collectionView: UICollectionView!
    
    private let max_length = 40
    private let limit = 3


    override func viewDidLoad() {
        super.viewDidLoad()
        


        setupView()
        setConstraints()
        makeRequest()
    }
}

extension FactsListViewController {
    private func setupView(){
        view.addSubview(factsListView)
        setCollectionConfigure()
        view.backgroundColor = .white
    }
    
}

// MARK: HTTP
extension FactsListViewController {
   
    private func makeRequest(){
        var request = URLRequest(url: URL(string: "https://catfact.ninja/facts?max_length=\(max_length)&limit=\(limit)")!)

        request.allHTTPHeaderFields = ["authToken" : "nil"]
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, responce, error in
            //print(String(decoding: data!, as: UTF8.self))
            if let data = data, let facts = try? JSONDecoder().decode(Facts.self, from: data) {
                print(facts.data?.count)
            }
        }
        task.resume()

    }
}

extension FactsListViewController{
    private func setConstraints(){
        factsListView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            factsListView.topAnchor.constraint(equalTo: view.topAnchor),
            factsListView.leftAnchor.constraint(equalTo: view.leftAnchor),
            factsListView.rightAnchor.constraint(equalTo: view.rightAnchor),
            factsListView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
            
        ])
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: factsListView.bottomAnchor, constant: 30),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FactsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FactCollectionViewCell", for: indexPath) as! FactCollectionViewCell
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 20
    
        
        return cell
    }
    
    private func setCollectionConfigure(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: view.frame.width - 10, height: 150)
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FactCollectionViewCell.self, forCellWithReuseIdentifier: "FactCollectionViewCell")
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        view.addSubview(collectionView!)
    }
}
