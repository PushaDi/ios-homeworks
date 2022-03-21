//
//  LogInViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 19.03.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var mainScrollView: UIScrollView = {
        let mainScrollView = UIScrollView()
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        return mainScrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var iconView: UIImageView = {
        let iconView = UIImageView(image: UIImage(named: "Icon"))
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    private lazy var usernameField: UITextField = {
        let usernameField = UITextField()
        usernameField.translatesAutoresizingMaskIntoConstraints = false
        usernameField.backgroundColor = .systemGray6
        usernameField.textColor = .black
        usernameField.font = .systemFont(ofSize: 16, weight: .regular)
        usernameField.autocapitalizationType = .none
        usernameField.tintColor = UIColor(named: "AccentColor")
        usernameField.placeholder = "Email or phone"
        return usernameField
    }()
    
    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.backgroundColor = .systemGray6
        passwordField.textColor = .black
        passwordField.font = .systemFont(ofSize: 16, weight: .regular)
        passwordField.autocapitalizationType = .none
        passwordField.tintColor = UIColor(named: "AccentColor")
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.layer.borderWidth = 0.5
        passwordField.layer.borderColor = UIColor.lightGray.cgColor
        
        return passwordField
    }()
    
    private lazy var logInStackView: UIStackView = {
        let logInStackView = UIStackView()
        logInStackView.translatesAutoresizingMaskIntoConstraints = false
        logInStackView.distribution = .fillEqually
        logInStackView.axis = .vertical
        logInStackView.alignment = .center
        logInStackView.layer.borderWidth = 0.5
        logInStackView.layer.borderColor = UIColor.lightGray.cgColor
        logInStackView.layer.cornerRadius = 10
        logInStackView.clipsToBounds = true
        return logInStackView
    }()
    
    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.titleLabel?.text = "Log In"
        logInButton.titleLabel?.textColor = .white
        logInButton.layer.cornerRadius = 10
        logInButton.clipsToBounds = true
        logInButton.setBackgroundImage(UIImage(named: "bluePixel"), for: .normal)
        switch logInButton.state {
            case .normal:
                logInButton.alpha = 1
            default:
                logInButton.alpha = 0.8
        }
        return logInButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSubviews()
        self.setupConstraints()
    }
    
    private func configureSubviews() {
        self.view.addSubview(self.mainScrollView)
        self.mainScrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.iconView)
        self.contentView.addSubview(self.logInStackView)
        self.logInStackView.addArrangedSubview(self.usernameField)
        self.logInStackView.addArrangedSubview(self.passwordField)
        self.contentView.addSubview(self.logInButton)
    }

    
    private func setupConstraints() {
        let mainScrollViewTopConstraint = self.mainScrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let mainScrollViewBottomConstraint = self.mainScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let mainScrollViewLeadingConstraint = self.mainScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let mainScrollViewTrailingConstraint = self.mainScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        let contentViewTopConstraint = self.contentView.topAnchor.constraint(equalTo: self.mainScrollView.topAnchor)
        let contentViewLeadingConstraint = self.contentView.leadingAnchor.constraint(equalTo: self.mainScrollView.leadingAnchor)
        let contentViewHeightConstraint = self.contentView.heightAnchor.constraint(equalTo: self.mainScrollView.heightAnchor)
        let contentViewWidthConstraint = self.contentView.widthAnchor.constraint(equalTo: self.mainScrollView.widthAnchor)
        
        let iconViewTopConstraint = self.iconView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120)
        let iconViewCenterXConstraint = self.iconView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let iconViewWidthConstraint = self.iconView.widthAnchor.constraint(equalToConstant: 100)
        let iconViewHeightConstraint = self.iconView.heightAnchor.constraint(equalToConstant: 100)
        
        let logInStackViewTopConstraint = self.logInStackView.topAnchor.constraint(equalTo: self.iconView.bottomAnchor, constant: 120)
        let logInStackViewLeadingConstraint = self.logInStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let logInStackViewTrailingConstraint = self.logInStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let logInStackViewHeightConstraint = self.logInStackView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([mainScrollViewTopConstraint,mainScrollViewBottomConstraint, mainScrollViewLeadingConstraint, mainScrollViewTrailingConstraint, contentViewTopConstraint, contentViewLeadingConstraint, contentViewWidthConstraint, contentViewHeightConstraint, iconViewTopConstraint, iconViewWidthConstraint, iconViewHeightConstraint, iconViewCenterXConstraint, logInStackViewTopConstraint, logInStackViewHeightConstraint, logInStackViewLeadingConstraint, logInStackViewTrailingConstraint])
        
        for view in [self.usernameField, self.passwordField] {
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: self.logInStackView.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.logInStackView.trailingAnchor)
            ])
        }
        

    }
}
