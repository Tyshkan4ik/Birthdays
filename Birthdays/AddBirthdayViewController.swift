//
//  AddBirthdayViewController.swift
//  Birthdays
//
//  Created by Виталий Троицкий on 25.04.2023.
//

import UIKit

class AddBirthdayViewController: UIViewController {
    
    private enum Constants {
        static let labelFirstNameTop: CGFloat = 44
        static let contraintsTop: CGFloat = 9
        static let constraintLeadingAndTrailing: CGFloat = 20
        static let labelBirthDateTop: CGFloat = 25
    }
    
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
    
    lazy var textFieldFirstName: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var textFieldLastName: UITextField = {
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
        let firstName = textFieldFirstName.text ?? ""
        let lastName = textFieldLastName.text ?? ""
        let birthdatePicker = datePicker.date
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newBirthday = Birthday(context: context)
        newBirthday.firstName = firstName
        newBirthday.lastName = lastName
        newBirthday.birthdate = birthdatePicker
        newBirthday.birthdayID = UUID().uuidString
        
        do {
            try context.save()
        } catch let error {
            print("Не удалось сохранить новое день рождеие из-за ошибки - \(error)")
        }
        dismiss(animated: true)
    }
    
    @objc
    private func clickButtonCancel() {
        dismiss(animated: true)
    }
    
    private func setupElements() {
        view.addSubview(labelFirstName)
        view.addSubview(labelLastName)
        view.addSubview(labelBirthDate)
        view.addSubview(textFieldFirstName)
        view.addSubview(textFieldLastName)
        view.addSubview(datePicker)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            labelFirstName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.labelFirstNameTop),
            labelFirstName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.constraintLeadingAndTrailing),
            
            textFieldFirstName.topAnchor.constraint(equalTo: labelFirstName.bottomAnchor, constant: Constants.contraintsTop),
            textFieldFirstName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.constraintLeadingAndTrailing),
            textFieldFirstName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.constraintLeadingAndTrailing),
            
            labelLastName.topAnchor.constraint(equalTo: textFieldFirstName.bottomAnchor, constant: Constants.contraintsTop),
            labelLastName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.constraintLeadingAndTrailing),
            
            textFieldLastName.topAnchor.constraint(equalTo: labelLastName.bottomAnchor, constant: Constants.contraintsTop),
            textFieldLastName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.constraintLeadingAndTrailing),
            textFieldLastName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.constraintLeadingAndTrailing),
            
            labelBirthDate.topAnchor.constraint(equalTo: textFieldLastName.bottomAnchor, constant: Constants.labelBirthDateTop),
            labelBirthDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.constraintLeadingAndTrailing),
            
            datePicker.topAnchor.constraint(equalTo: labelBirthDate.bottomAnchor, constant: Constants.contraintsTop),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.constraintLeadingAndTrailing),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.constraintLeadingAndTrailing)
        ])
    }
    
}
