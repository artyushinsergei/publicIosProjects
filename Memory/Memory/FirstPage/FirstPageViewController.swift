//
//  ViewController.swift
//  Memory
//
//  Created by SERGEI on 13.12.2022.
//

import UIKit

class FirstPageViewController: UIViewController {

    let firstPageView = FirstPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //makeRequest()
        setupView()
        setConstrains()
    }
}

extension FirstPageViewController{
    private func setupView(){
        view.addSubview(firstPageView)
        view.backgroundColor = .lightText
    }
}

extension FirstPageViewController {
    private func setConstrains(){
        firstPageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstPageView.topAnchor.constraint(equalTo: view.topAnchor),
            firstPageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            firstPageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            firstPageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: HTTP
extension FirstPageViewController{
    private func makeRequest(){
        var request = URLRequest(url: URL(string: "https://api.scripture.api.bible/v1/bibles")!)

        request.allHTTPHeaderFields = ["authToken" : "nil"]
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) {data, responce, error in
            //print(String(decoding: data!, as: UTF8.self))
            if let data = data, let bible = try? JSONDecoder().decode(Bible.self, from: data) {
                print()
            }
        }
        task.resume()

    }
}
