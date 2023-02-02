//
//  ViewController.swift
//  Meteo
//
//  Created by SERGEI on 02.02.2023.
//

import SnapKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        APIManager.shared.getWeather { [weak self] values in
            DispatchQueue.main.async {
                guard let self else {return}
                self.tempData = values
                self.tableView.reloadData()
            }

        }
    }

    // MARK: Private propersties
    private var tableView = UITableView()
    private var tempData: [Double] = []
}

    // MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tempData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let textValue = tempData[indexPath.row]
        cell.textLabel?.text = "\(textValue)"
        return cell
    }
    
}
