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
        table.layer.cornerRadius = 10
        table.alpha = 0.8
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
    
    lazy var backgroundImage: UIImageView = {
       let imageView = UIImageView()
        let image = UIImage(named: "happy1")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        view.addSubview(backgroundImage)
        view.addSubview(table)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
    
    /// Настройка формата даты
    private func dateFormatterSettings() {
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
    }
    
    @objc
    private func clickButtonAdd() {
        let modalController = AddBirthdayViewController()
        let controller = UINavigationController(rootViewController: modalController)
        modalController.delegate = self
        navigationController?.present(controller, animated: true)
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
        cell.selectionStyle = .none
        cell.contentConfiguration = configuration
        return cell
    }
}

//MARK: - extension - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
}

//MARK: - extension - AddBirthdayViewControllerProtocol

extension ViewController: AddBirthdayViewControllerProtocol {
    
    /// Получение данных с CoreData
    func getBirtdays() {
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
