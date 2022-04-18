//
//  ProfileHeaderView.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 10.03.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    private lazy var profileImageView: UIImageView = UIImageView(image: UIImage(named: "profile image"))
    private lazy var nameLabel: UILabel = UILabel()
    private lazy var statusView: UITextView = UITextView()
    private lazy var showStatusButton: UIButton = UIButton()
    private lazy var statusField: UITextField = UITextField()
    
    private var statusText: String = "Waiting for something..."
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupProfileImageView()
        self.setupNameLabel()
        self.setupStatusView()
        self.setupStatusField()
        self.setupShowStatusButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProfileImageView() {
        self.addSubview(profileImageView)

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.clipsToBounds = true
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 60

        let topConstraint = profileImageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16)
        let leadingConstraint = profileImageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
        let heightConstraint = profileImageView.heightAnchor.constraint(equalToConstant: 120)
        let widthConstraint = profileImageView.widthAnchor.constraint(equalToConstant: 120)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, heightConstraint, widthConstraint])
    }
    
    private func setupNameLabel() {
        self.addSubview(nameLabel)

        nameLabel.text = "Lazy Shiba"
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 18)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .natural
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let topConstraint = nameLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 27)
        let trailingContraint = nameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        let leadingConstraint = nameLabel.leadingAnchor.constraint(equalTo: self.profileImageView.trailingAnchor, constant: 16)
        let heightConstraint = nameLabel.heightAnchor.constraint(equalToConstant: 30)
        
        NSLayoutConstraint.activate([topConstraint, trailingContraint, leadingConstraint, heightConstraint])
    }
    
    private func setupShowStatusButton() {
        self.addSubview(showStatusButton)

        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.backgroundColor = .systemBlue
        
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.layer.shadowOffset = CGSize(width: 4,height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = showStatusButton.topAnchor.constraint(equalTo: self.statusField.bottomAnchor, constant: 16)
        let leadingConstraint = showStatusButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 16)
        let trailingConstraint = showStatusButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16)
        let heightContstraint = showStatusButton.heightAnchor.constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightContstraint])
        
        showStatusButton.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
    }
    
    private func setupStatusView() {
        self.isOpaque = false
        self.addSubview(self.statusView)
        
        self.statusView.text = self.statusText
        self.statusView.font = UIFont.systemFont(ofSize: 14)
        self.statusView.textColor = .gray
        self.statusView.backgroundColor = .clear
        self.statusView.isEditable = false
        
        self.statusView.translatesAutoresizingMaskIntoConstraints = false

        let bottomConstraint = self.statusView.bottomAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 40)
        let leadingConstraint = self.statusView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 152)
        let trailingConstraint = self.statusView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        let heightConstraint = self.statusView.heightAnchor.constraint(equalToConstant: 25)
        
        NSLayoutConstraint.activate([bottomConstraint, leadingConstraint, trailingConstraint, heightConstraint])
    }
    
    private func setupStatusField() {
        self.addSubview(statusField)
        
        statusField.addTarget(self, action: #selector(self.statusTextChanged(_:)), for: .editingChanged)
        
        statusField.backgroundColor = .white
        statusField.textColor = .black
        statusField.font = UIFont.systemFont(ofSize: 15)
        
        statusField.layer.borderWidth = 1
        statusField.layer.borderColor = UIColor.black.cgColor
        statusField.layer.cornerRadius = 12
        statusField.clipsToBounds = true
        
        statusField.translatesAutoresizingMaskIntoConstraints = false
        
        let topConstraint = statusField.topAnchor.constraint(equalTo: self.statusView.bottomAnchor, constant: 16)
        let leadingConstraint = statusField.leadingAnchor.constraint(equalTo: self.statusView.leadingAnchor)
        let trailingConstraint = statusField.trailingAnchor.constraint(equalTo: self.statusView.trailingAnchor)
        let heightConstraint = statusField.heightAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint])
    }
    
    private func emptyFieldsCheck() -> Bool {
        var textFieldIsEmpty = true
        if self.statusField.hasText {
            textFieldIsEmpty = false
        } else {
            textFieldIsEmpty = true
            UIView.animate(withDuration: 1) {
                self.statusField.backgroundColor = .systemRed
            } completion: { _ in
                UIView.animate(withDuration: 0.5) {
                    self.statusField.backgroundColor = .white
                } completion: { _ in
                    
                }
            }
        }
        return textFieldIsEmpty
    }
    
    @objc private func buttonPressed() {
        if !self.emptyFieldsCheck() {
            self.statusView.text = statusText
        }
        return
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        
        
        if let newStatus = self.statusField.text
        {
            statusText = newStatus
        } else {return}
    }
}
