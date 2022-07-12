//
//  AlbumViewController.swift
//  AlbumProject
//
//  Created by SERGEI on 03.07.2022.
//

import Foundation
import UIKit

class AlbumViewController: UIViewController{
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.register(AlbumsTableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let serchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        setupViews()
        setupDelegate()
        setConstrains()
        setNavigationBar()
        setupSerchController()
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    private func setupDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
        
        serchController.searchBar.delegate = self
    }
    
    private func setNavigationBar(){
        navigationItem.title = "Albums"
        
        navigationItem.searchController = serchController
        
        let userInfoButton = createCustomButton(selector: #selector (userInfoButtonTapped))
        navigationItem.rightBarButtonItem = userInfoButton
    }
    
    private func setupSerchController(){
        serchController.searchBar.placeholder = "Search"
        serchController.obscuresBackgroundDuringPresentation = false
    }
    
    @objc private func userInfoButtonTapped(){
        let userInfoViewController = UserInfoViewController()
        navigationController?.pushViewController(userInfoViewController, animated: true)
    }
    
}

// MARK: UITableViewDataSource
extension AlbumViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            10
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AlbumsTableViewCell
            return cell
        }
}

// MARK: UITableViewDelegate
extension AlbumViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailAlbumViewController = DetailAlbumViewController()
        navigationController?.pushViewController(detailAlbumViewController, animated: true)
    }
}

// MARK: UISearchBarDelegate
extension AlbumViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

extension AlbumViewController{

    func setConstrains(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}


