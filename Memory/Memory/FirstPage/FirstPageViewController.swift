//
//  ViewController.swift
//  Memory
//
//  Created by SERGEI on 13.12.2022.
//

import UIKit

class FirstPageViewController: UINavigationController {

    let firstPageView = FirstPageView()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstrains()
        setConfigure()
    }
}
// MARK: setConfigure
extension FirstPageViewController {
    private func setConfigure(){
        firstPageView.firstButton.addTarget(self, action: #selector(firstFactOnClick), for: .touchUpInside)
    }
}

// MARK: setupView
extension FirstPageViewController{
    private func setupView(){
        view.addSubview(firstPageView)
    }
}

// MARK: setConstrains
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

// MARK: onClick Methods
extension FirstPageViewController {
    @objc func firstFactOnClick(){
        let vc = FactPageViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}


