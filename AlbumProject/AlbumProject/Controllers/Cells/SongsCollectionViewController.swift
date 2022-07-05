//
//  SongsCollectionViewCell.swift
//  AlbumProject
//
//  Created by SERGEI on 04.07.2022.
//

import Foundation
import UIKit

class SongsCollectionViewCell: UICollectionViewCell{
    let nameSongLable: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
    
    func setConstrains(){
        NSLayoutConstraint.activate([
            nameSongLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            nameSongLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            nameSongLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            nameSongLable.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
