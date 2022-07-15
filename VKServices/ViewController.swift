//
//  ViewController.swift
//  VKServices
//
//  Created by Anastasia Ilina on 14.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        parseJSON()
        view.addSubview(tableView)
        setupConstraints()
    }

    func parseJSON () {
        guard let url = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
        
            guard let data = data else { return }
            
            do {
                let apps = try JSONDecoder().decode(Root.self, from: data)
                print(apps.status)
            } catch {
                print(error)
            }
        
        }.resume()
    }
    
    fileprivate enum CellReuseIdentifiers: String {
        case service = "ServiceCellReuse"
    }
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ServiceTableViewCell.self, forCellReuseIdentifier: CellReuseIdentifiers.service.rawValue)
        return tableView
    }()
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([

            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ServiceTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: CellReuseIdentifiers.service.rawValue,
            for: indexPath
        ) as? ServiceTableViewCell else {
            fatalError()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
 
}
