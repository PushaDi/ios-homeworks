//
//  LogInViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 19.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    let logoImageView: UIImageView = UIImageView(image: UIImage(named: "Icon"))
    let logInStackView: UIStackView = UIStackView()
    let usernameField: UITextField = UITextField()
    let passwordField: UITextField = UITextField()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()

    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.setupLogo()
        self.setupLogInView()
    }
    
    private func setupLogo() {
        self.view.addSubview(logoImageView)
        
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let xCenterConstraint = self.logoImageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor)
        let widthConstraint = self.logoImageView.widthAnchor.constraint(equalToConstant: 100)
        let heightConstraint = self.logoImageView.heightAnchor.constraint(equalToConstant: 100)
        let topConstraint = self.logoImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 120)
        
        NSLayoutConstraint.activate([xCenterConstraint, widthConstraint, heightConstraint, topConstraint])
    }
    
    private func setupLogInView() {
        self.view.addSubview(logInStackView)
        self.logInStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.logInStackView.addArrangedSubview(self.usernameField)
        self.logInStackView.addArrangedSubview(self.passwordField)
        self.logInStackView.layer.
        self.logInStackView.layer.borderColor = UIColor.lightGray.cgColor
        self.logInStackView.layer.borderWidth = 0.5
        self.logInStackView.layer.cornerRadius = 10
        
        
        self.usernameField.backgroundColor = .systemGray6
        self.passwordField.backgroundColor = .systemGray6
        
        let topConstraint = self.logInStackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120)
        let leadingConstraint = self.logInStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailingConstraint = self.logInStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let heightConstraint = self.logInStackView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, heightConstraint])
    }
}
