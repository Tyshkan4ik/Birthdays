//
//  AddBirthdayViewController.swift
//  Birthdays
//
//  Created by Виталий Троицкий on 25.04.2023.
//

import UIKit

class AddBirthdayViewController: UIViewController {
    
    //MARK: - Property
    
    lazy var buttonSave: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Save"
        button.target = self
        button.action = #selector(clickButtonSave)
        return button
    }()
    
    lazy var buttonCancel: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Cancel"
        button.target = self
        button.action = #selector(clickButtonCancel)
        return button
    }()
    
    lazy var labelFirstName: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelLastName: UILabel = {
        let label = UILabel()
        label.text = "Фамилия"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var labelBirthDate: UILabel = {
        let label = UILabel()
        label.text = "Дата рождения"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var TextFieldFirstName: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var TextFieldLastName: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var datePicker: UIDatePicker = {
       let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .date
        picker.maximumDate = Date()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    
    //MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationControllerSettings()
        setupElements()
        setupConstraints()
    }
    
    private func setupNavigationControllerSettings() {
        title = "Добавить День рождение"
        navigationItem.rightBarButtonItem = buttonSave
        navigationItem.leftBarButtonItem = buttonCancel
    }
    
    @objc
    private func clickButtonSave() {
        
    }
    
    @objc
    private func clickButtonCancel() {
        dismiss(animated: true)
    }
    
    private func setupElements() {
        view.addSubview(labelFirstName)
        view.addSubview(labelLastName)
        view.addSubview(labelBirthDate)
        view.addSubview(TextFieldFirstName)
        view.addSubview(TextFieldLastName)
        view.addSubview(datePicker)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            labelFirstName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            labelFirstName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            TextFieldFirstName.topAnchor.constraint(equalTo: labelFirstName.bottomAnchor, constant: 9),
            TextFieldFirstName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            TextFieldFirstName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            labelLastName.topAnchor.constraint(equalTo: TextFieldFirstName.bottomAnchor, constant: 6),
            labelLastName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            TextFieldLastName.topAnchor.constraint(equalTo: labelLastName.bottomAnchor, constant: 9),
            TextFieldLastName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            TextFieldLastName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            labelBirthDate.topAnchor.constraint(equalTo: TextFieldLastName.bottomAnchor, constant: 25),
            labelBirthDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            datePicker.topAnchor.constraint(equalTo: labelBirthDate.bottomAnchor, constant: 9),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
}
