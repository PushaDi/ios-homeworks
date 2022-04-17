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
        passwordField.addTarget(self, action: #selector(self.checkPasswordLength), for: .editingDidEnd)
        return passwordField
    }()
    
    private lazy var warningLabel: UILabel = {
        let warningLabel = UILabel()
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.text = "Слишком короткий пароль!"
        warningLabel.textColor = .systemRed
        warningLabel.font = .systemFont(ofSize: 12)
        warningLabel.isHidden = true
        warningLabel.alpha = 0
        return warningLabel
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
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setBackgroundImage(UIImage(named: "bluePixel"), for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.layer.cornerRadius = 10
        logInButton.clipsToBounds = true
        switch logInButton.state {
            case .normal:
                logInButton.alpha = 1
            default:
                logInButton.alpha = 0.8
        }
        logInButton.addTarget(self, action: #selector(self.logInButtonDidTap), for: .touchUpInside)
        return logInButton
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(self.kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(self.kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.configureSubviews()
        self.setupConstraints()
    }
    
    private func configureSubviews() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.mainScrollView)
        self.mainScrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.iconView)
        self.contentView.addSubview(self.logInStackView)
        self.contentView.addSubview(self.warningLabel)
        self.logInStackView.addArrangedSubview(self.usernameField)
        self.logInStackView.addArrangedSubview(self.passwordField)
        self.contentView.addSubview(self.logInButton)
    }

    
    private func setupConstraints() {
        let mainScrollViewTopConstraint = self.mainScrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let mainScrollViewBottomConstraint = self.mainScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let mainScrollViewLeadingConstraint = self.mainScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let mainScrollViewTrailingConstraint = self.mainScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        let contentViewTopConstraint = self.contentView.topAnchor.constraint(equalTo: self.mainScrollView.topAnchor)
        let contentViewBottomConstraint = self.contentView.bottomAnchor.constraint(equalTo: self.mainScrollView.bottomAnchor)
        let contentViewLeadingConstraint = self.contentView.leadingAnchor.constraint(equalTo: self.mainScrollView.leadingAnchor)
        let contentViewTralingConstraint = self.contentView.trailingAnchor.constraint(equalTo: self.mainScrollView.trailingAnchor)
        let contentViewWidthConstraint = self.contentView.widthAnchor.constraint(equalTo: self.mainScrollView.widthAnchor)
        let contentViewHeightConstraint = self.contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        
        let iconViewTopConstraint = self.iconView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120)
        let iconViewCenterXConstraint = self.iconView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let iconViewWidthConstraint = self.iconView.widthAnchor.constraint(equalToConstant: 100)
        let iconViewHeightConstraint = self.iconView.heightAnchor.constraint(equalToConstant: 100)
        
        let logInStackViewTopConstraint = self.logInStackView.topAnchor.constraint(equalTo: self.iconView.bottomAnchor, constant: 120)
        let logInStackViewLeadingConstraint = self.logInStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let logInStackViewTrailingConstraint = self.logInStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let logInStackViewHeightConstraint = self.logInStackView.heightAnchor.constraint(equalToConstant: 100)
        
        let warninglabelTopConstraint = self.warningLabel.topAnchor.constraint(equalTo: self.logInStackView.bottomAnchor, constant: 2)
        let warningLabelLeadingConstraint = self.warningLabel.leadingAnchor.constraint(equalTo: self.logInStackView.leadingAnchor)
        let warningLabelTrailingConstraint = self.warningLabel.trailingAnchor.constraint(equalTo: self.logInStackView.trailingAnchor)
        let warningLabelHeightConstraint = self.warningLabel.heightAnchor.constraint(equalToConstant: 12)
        
        let logInButtonTopConstraint = self.logInButton.topAnchor.constraint(equalTo: self.logInStackView.bottomAnchor, constant: 16)
        let logInButtonLeadingConstraint = self.logInButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let logInButtonTrailingConstraint = self.logInButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let logInButtonHeightConstraint = self.logInButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            mainScrollViewTopConstraint,mainScrollViewBottomConstraint, mainScrollViewLeadingConstraint, mainScrollViewTrailingConstraint,
            contentViewTopConstraint, contentViewBottomConstraint, contentViewLeadingConstraint, contentViewTralingConstraint, contentViewWidthConstraint, contentViewHeightConstraint,
            iconViewTopConstraint, iconViewWidthConstraint, iconViewHeightConstraint, iconViewCenterXConstraint,
            warninglabelTopConstraint, warningLabelLeadingConstraint, warningLabelTrailingConstraint, warningLabelHeightConstraint,
            logInStackViewTopConstraint, logInStackViewHeightConstraint, logInStackViewLeadingConstraint, logInStackViewTrailingConstraint,
            logInButtonTopConstraint, logInButtonLeadingConstraint, logInButtonTrailingConstraint, logInButtonHeightConstraint])
        
        for view in [self.usernameField, self.passwordField] {
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: self.logInStackView.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.logInStackView.trailingAnchor)
            ])
        }
    }
    
    private func emptyFieldsCheck() -> Bool {
        var textFieldIsEmpty = true
        for textfield in [self.usernameField, self.passwordField] {
            if textfield.hasText {
                textFieldIsEmpty = false
            } else {
                textFieldIsEmpty = true
                UIView.animate(withDuration: 1)
                {
                    textfield.backgroundColor = .systemRed
                } completion: { _ in
                    UIView.animate(withDuration: 0.5) {
                        textfield.backgroundColor = .systemGray6
                    } completion: { _ in
                    }
                }
            }
        }
        return textFieldIsEmpty
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.mainScrollView.contentInset.bottom = kbdSize.height
            self.mainScrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }

    @objc private func kbdHide(notification: NSNotification) {
        self.mainScrollView.contentInset.bottom = .zero
        self.mainScrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc private func logInButtonDidTap() {
        if !self.emptyFieldsCheck() {
            if self.usernameField.text == username && self.passwordField.text == password {
                let profileVc = ProfileViewController()
                self.navigationController?.pushViewController(profileVc, animated: true)
            } else {
                let wrongPasswordAlert = UIAlertController(title: "Неправильный логин и(или) пароль", message: "Проверьте правильность введенных данных!", preferredStyle: .alert)
                wrongPasswordAlert.addAction(UIAlertAction(title: "Ввести заново", style: .default, handler: {action in enterAgain()}))
                
                func enterAgain() {return}
                
                self.present(wrongPasswordAlert, animated: true, completion: nil)
            }
        } else {return}
    }
    
    @objc private func checkPasswordLength() {
        if let enteredPassword = self.passwordField.text {
            if enteredPassword.count < 5 {
                UIView.animate(withDuration: 0.5) {
                    self.warningLabel.isHidden = false
                    self.warningLabel.alpha = 1
                } completion: { _ in
                    
                }
            } else {
                UIView.animate(withDuration: 0.5) {
                    self.warningLabel.isHidden = true
                    self.warningLabel.alpha = 0
                } completion: { _ in
                    
                }
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.warningLabel.isHidden = false
                self.warningLabel.alpha = 1
            } completion: { _ in
                
            }
        }
    }
}
