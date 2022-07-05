//
//  DetailAlbumViewController.swift
//  AlbumProject
//
//  Created by SERGEI on 04.07.2022.
//

import Foundation
import UIKit

class DetailAlbumViewController: UIViewController{
    private let albumLogo: UIImageView = {
        let logo = UIImageView()
        logo.backgroundColor = .red
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private let albumNameLable: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0
        lable.text = "Album name"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistNameLable: UILabel = {
        let lable = UILabel()
        lable.text = "Artist name"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()

    private let releaseDataLable: UILabel = {
        let lable = UILabel()
        lable.text = "Release date"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let trackCountLable: UILabel = {
        let lable = UILabel()
        lable.text = "1 track"
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }
    
    private collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        layout.minimumLineSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.bounces = false
        collectionView.register(SongsCollectionViewCell, forCellWithReuseIdentifier: :"cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(albumLogo)
        stackView = UIStackView(arrangedSubViews: [albumNameLable,artistNameLable,releaseDataLable,trackCountLable], axis: .vertical, spasing: 10, distribution: .fillProportionally)
        view.addSubview(stackView)
        view.addSubview(collectionView)
    }
    
    private func setDelegate(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
 
}

extension DetailAlbumViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SongsCollectionViewCell
        cell.nameSongLable.text = "Name song"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 20)
    }
}

extension DetailAlbumViewController{
    
    private func setConstrains(){
        
    }
    
}


