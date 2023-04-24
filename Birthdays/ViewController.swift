//
//  ViewController.swift
//  Birthdays
//
//  Created by Виталий Троицкий on 24.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    lazy var table: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var buttonAdd: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "plus")
        button.target = self
        button.action = #selector(clickButtonAdd)
        return button
    }()
    
    //MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setupElements()
        setupConstraints()
        setupNavigationControllerSettings()
    }
    
    private func setupElements() {
        view.addSubview(table)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupTable() {
        table.delegate = self
        table.dataSource = self
    }
    
    private func setupNavigationControllerSettings() {
        title = "Список всех дней рождений"
        navigationItem.rightBarButtonItem = buttonAdd
    }
    
    @objc
    private func clickButtonAdd() {
        let modalController = AddBirthdayViewController()
        let controller = UINavigationController(rootViewController: modalController)
        navigationController?.present(controller, animated: true)
    }
}

//MARK: - extension - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reuseCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }

        return cell
    }
}

//MARK: - extension - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}
