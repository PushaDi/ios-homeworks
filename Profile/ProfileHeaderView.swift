//
//  ProfileHeaderView.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 10.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var profileImageView: UIImageView = UIImageView(image: UIImage(named: "profile image"))
    private lazy var nameLabel: UILabel = UILabel()
    private lazy var statusField: UITextField = UITextField()
    private lazy var showStatusButton: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupProfileImageView()
        self.setupNameLabel()
        self.setupShowStatusButton()
        self.setupStatusField()
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
        profileImageView.layer.cornerRadius = 65

        let topConstraint = profileImageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16)
        let leadingConstraint = profileImageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
        let heightConstraint = profileImageView.heightAnchor.constraint(equalToConstant: 130)
        let widthConstraint = profileImageView.widthAnchor.constraint(equalToConstant: 130)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, heightConstraint, widthConstraint])
    }
    
    private func setupNameLabel() {
        self.addSubview(nameLabel)

        nameLabel.text = "Lazy Shiba"
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 18)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        
        let topConstraint = nameLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 27)
        let trailingContraint = nameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: 16)
        let leadingConstraint = nameLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 5)
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
        
        let topConstraint = showStatusButton.topAnchor.constraint(equalTo: self.profileImageView.bottomAnchor, constant: 16)
        let leadingConstraint = showStatusButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 16)
        let trailingConstraint = showStatusButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16)
        let heightContstraint = showStatusButton.heightAnchor.constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightContstraint])
    }
    
    private func setupStatusField() {
        self.addSubview(statusField)
        
        statusField.placeholder = "Waiting for something"
        statusField.font = UIFont.systemFont(ofSize: 14)
        statusField.textColor = .gray
        
        statusField.translatesAutoresizingMaskIntoConstraints = false

        
        let bottomConstraint = statusField.bottomAnchor.constraint(equalTo: self.showStatusButton.topAnchor, constant: -34)
        let leadingConstraint = statusField.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 152)
        let trailingConstraint = statusField.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor)
        let widthConstraint = statusField.widthAnchor.constraint(equalToConstant: 20)
        
        NSLayoutConstraint.activate([bottomConstraint, leadingConstraint, trailingConstraint, widthConstraint])
    }
}

