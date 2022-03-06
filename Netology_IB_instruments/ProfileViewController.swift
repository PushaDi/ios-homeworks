//
//  ProfileViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 25.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private let profileImage: UIImage? = UIImage(named: "profile image")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.view = view
        view.backgroundColor = .systemCyan
        self.title = "Профиль"
        
        self.setupImageView()
        self.setupNameLabelView()
        self.setupDobLabelView()
        self.setupPobLabelView()
        self.setupTextView()
    }
    
    private func setupImageView() {
        let profileImageView: UIImageView = UIImageView(image: profileImage)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileImageView)

        
        let topConstraint = profileImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10)
        
        let leadingConstraint = profileImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10)
        
        let widthConstraint = profileImageView.widthAnchor.constraint(equalToConstant: 150.0)
        
        let heightConstraint = profileImageView.heightAnchor.constraint(equalToConstant: 150.0)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, widthConstraint, heightConstraint])
        
    }
    
    private func setupNameLabelView() {
        let nameLabel: UILabel = UILabel()
        nameLabel.text = "Имя"
        nameLabel.textColor = .black
        nameLabel.backgroundColor = .systemGray
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        
        
        let topConstraint = nameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10.0)
        
        let leadingConstraint = nameLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 180.0)
        
        let trailingConstraint = nameLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant:  -10.0)
        
        let heightConstraint = nameLabel.heightAnchor.constraint(equalToConstant: 40.0)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint])
    }
    
    private func setupDobLabelView() {
        let dobLabel: UILabel = UILabel()
        dobLabel.text = "Дата рождения"
        dobLabel.textColor = .black
        dobLabel.backgroundColor = .systemGray2
        
        dobLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dobLabel)
        
        
        let topConstraint = dobLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 65.0)
        
        let leadingConstraint = dobLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 180.0)
        
        let trailingConstraint = dobLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant:  -10.0)
        
        let heightConstraint = dobLabel.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint])
    }
    
    private func setupPobLabelView() {
        let pobLabel: UILabel = UILabel()
        pobLabel.text = "Место рождения"
        pobLabel.textColor = .black
        pobLabel.backgroundColor = .systemGray3
        
        pobLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pobLabel)
        
        
        let topConstraint = pobLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 120.0)
        
        let leadingConstraint = pobLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 180.0)
        
        let trailingConstraint = pobLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant:  -10.0)
        
        let heightConstraint = pobLabel.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint])
    }
    
    private func setupTextView() {
        let textView = UITextView()
        textView.backgroundColor = .systemGray4
        textView.text = "Тут будет много текста..."

        textView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textView)
        
        let topConstraint = textView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 170.0)
        
        let leadingConstraint = textView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10.0)
        
        let trailingConstraint = textView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant:  -10.0)
        
        let bottomConstraint = textView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10.0)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
    }
}
