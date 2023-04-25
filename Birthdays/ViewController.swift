//
//  ViewController.swift
//  Birthdays
//
//  Created by Виталий Троицкий on 24.04.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    var birthdays = [Birthday]()
    
    let dateFormatter = DateFormatter()
    
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
        setupTable()
        dateFormatterSettings()
        getBirtdays()
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
    
    private func dateFormatterSettings() {
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
    }
    
    @objc
    private func clickButtonAdd() {
        let modalController = AddBirthdayViewController()
        let controller = UINavigationController(rootViewController: modalController)
        navigationController?.present(controller, animated: true)
    }
    
    private func getBirtdays() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = Birthday.fetchRequest() as NSFetchRequest<Birthday>
        
        let sortDescriptor1 = NSSortDescriptor(key: "lastName", ascending: true)
        let sortDescriptor2 = NSSortDescriptor(key: "firstName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor1, sortDescriptor2]
        
        do {
            birthdays = try context.fetch(fetchRequest)
        } catch let error {
            print("Не удалось загрузить дни рождения из-за ошибки - \(error)")
        }
        table.reloadData()
    }
}

//MARK: - extension - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthdays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            let birthday = birthdays[indexPath.row]
            var configuration = cell.defaultContentConfiguration()
            
            let firstName = birthday.firstName ?? ""
            let lastName = birthday.lastName ?? ""
            
            configuration.text = firstName + " " + lastName
            if let date = birthday.birthdate {
                configuration.secondaryText = dateFormatter.string(from: date)
            } else {
                configuration.secondaryText = ""
            }
            
        cell.contentConfiguration = configuration
        return cell
    }
}

//MARK: - extension - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}
