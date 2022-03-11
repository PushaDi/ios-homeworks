//
//  ProfileHeaderView.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 10.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var profileImageView = UIImageView(image: UIImage(named: "profile image"))
    private lazy var nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(profileImageView)
        self.setupProfileImageView()
        self.addSubview(nameLabel)
        self.setupNameLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProfileImageView() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.clipsToBounds = true
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 65
        
        let topConstraint = profileImageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16)
        let leadingConstraint = profileImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 16)
        let heightConstraint = profileImageView.heightAnchor.constraint(equalToConstant: 130)
        let widthConstraint = profileImageView.widthAnchor.constraint(equalToConstant: 130)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, heightConstraint, widthConstraint])
    }
    
    private func setupNameLabel() {
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
}

