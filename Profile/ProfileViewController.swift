//
//  ProfileViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 10.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var profileHeaderView = ProfileHeaderView()
    private var newButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupButton()
    }
    
    private func setupView() {
        self.view.backgroundColor = .lightGray
        self.title = "Профиль"
        self.view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let topConstraint = profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let heightConstraint = profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, heightConstraint])
    }
    
    private func setupButton() {
        self.view.addSubview(newButton)
        newButton.setTitle("Simply Button", for: .normal)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.backgroundColor = .systemRed
       
        let leadingConstraint = newButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = newButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, bottomConstraint])
    }
}
