//
//  FirstBiblePageViewController.swift
//  Memory
//
//  Created by SERGEI on 20.12.2022.
//

import UIKit

class FactPageViewController: UIViewController {
    
    private let firstFactView = FactPageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        makeRequest()
    }
}

// MARK: HTTP
extension FactPageViewController {
    private func makeRequest(){
        var request = URLRequest(url: URL(string: "https://catfact.ninja/fact")!)

        request.allHTTPHeaderFields = ["authToken" : "nil"]
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { [self]data, responce, error in
            //print(String(decoding: data!, as: UTF8.self))
            if let data = data, let fact = try? JSONDecoder().decode(Fact.self, from: data) {
                DispatchQueue.main.sync {
                    firstFactView.factLable.text = fact.fact
                   if let fact = fact.length {
                        firstFactView.lengthLable.text = String("\(fact)")
                   } else {
                        firstFactView.lengthLable.text = "Empty string"
                    }
                }
            }
        }
        task.resume()

    }
}

// MARK: setupView
extension FactPageViewController {
    private func setupView(){
        view.addSubview(firstFactView)
        view.backgroundColor = .white
    }
}

//MARK: setConstraints
extension FactPageViewController {
    private func setConstraints(){
        firstFactView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstFactView.topAnchor.constraint(equalTo: view.topAnchor),
            firstFactView.leftAnchor.constraint(equalTo: view.leftAnchor),
            firstFactView.rightAnchor.constraint(equalTo: view.rightAnchor),
            firstFactView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension FactPageViewController {
    private func setConfigure(){
        firstFactView.backButton.addTarget(self, action: #selector(backButtonOnClick), for: .touchUpInside)
    }
}

extension FactPageViewController{
    @objc func backButtonOnClick(){
            let vc = FactPageViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
}
