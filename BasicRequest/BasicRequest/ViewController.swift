//
//  ViewController.swift
//  BasicRequest
//
//  Created by SERGEI on 31.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.shared.getUsers {users in
            for user in users {
                print(user.name ?? "JEKA")
            }
        }
        
        ApiManager.shared.getPosts{ posts in
            print(posts.count)
        }
        
        ApiManager.shared.getAlbums{albums in
            print(albums.count)
        }
    }
}

