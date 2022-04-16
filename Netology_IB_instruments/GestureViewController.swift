//
//  GestureViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 15.04.2022.
//

import UIKit

class GestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupConstraints()
        self.setupTapGestures()
    }
    
    private let profileImageTapGestureRecogniser = UITapGestureRecognizer()
    private let exitButtonTapGestureRecogniser = UITapGestureRecognizer()
    
    private lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .black
        backgroundView.isHidden = true
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    private lazy var exitButton: UIImageView = {
        let exitButton = UIImageView(image: UIImage(systemName: "multiply.square.fill"))
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.isHidden = true
        exitButton.isUserInteractionEnabled = true
        exitButton.alpha = 0
        
        return exitButton
    }()
    
    private lazy var profileImageView: UIImageView = {
        let profileView = UIImageView(image: UIImage(named: "profile image"))
        profileView.isUserInteractionEnabled = true
        profileView.contentMode = .scaleToFill
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.layer.borderWidth = 3
        profileView.layer.borderColor = UIColor.white.cgColor
        profileView.clipsToBounds = true
        profileView.layer.masksToBounds = true
        profileView.layer.cornerRadius = 60
        return profileView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Lazy Shiba"
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.textColor = .black
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusView: UITextView = {
        let textView = UITextView()
        textView.text = self.statusText
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = .gray
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var showStatusButton: UIButton = {
        let showStatusButton = UIButton()
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.layer.shadowOffset = CGSize(width: 4,height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return showStatusButton
    }()
    
    private lazy var statusField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var statusText: String = "Waiting for something..."
    
    private var profileImageViewTopConstraint: NSLayoutConstraint?
    private var profileImageViewLeadingConstraint: NSLayoutConstraint?
    private var profileImageViewHeightConstraint: NSLayoutConstraint?
    private var profileImageViewWidthConstraint: NSLayoutConstraint?
    
    private func setupView() {
        self.view.backgroundColor = .systemGray
        self.view.addSubview(self.backgroundView)
        self.backgroundView.addSubview(self.exitButton)
        self.view.addSubview(self.profileImageView)
        self.view.addSubview(self.nameLabel)
        self.view.addSubview(self.statusView)
        self.view.addSubview(self.statusField)
        self.view.addSubview(self.showStatusButton)
    }
    
    private func setupConstraints() {
        self.profileImageViewTopConstraint = self.profileImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16)
        self.profileImageViewLeadingConstraint = self.profileImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        self.profileImageViewHeightConstraint = self.profileImageView.heightAnchor.constraint(equalToConstant: 120)
        self.profileImageViewWidthConstraint = self.profileImageView.widthAnchor.constraint(equalToConstant: 120)
        
        let nameLabelTopConstraint = nameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 27)
        let nameLabelTrailingContraint = nameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let nameLabelLeadingConstraint = nameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 152)
        let nameLabelHeightConstraint = nameLabel.heightAnchor.constraint(equalToConstant: 30)
        
        let showStatusButtonTopConstraint = showStatusButton.topAnchor.constraint(equalTo: self.statusField.bottomAnchor, constant: 16)
        let showStatusButtonLeadingConstraint = showStatusButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let showStatusButtonTrailingConstraint = showStatusButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let showStatusButtonHeightContstraint = showStatusButton.heightAnchor.constraint(equalToConstant: 50)

        let statusViewBottomConstraint = statusView.bottomAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 40)
        let statusViewLeadingConstraint = statusView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 152)
        let statusViewTrailingConstraint = statusView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let statusViewHeightConstraint = statusView.heightAnchor.constraint(equalToConstant: 25)
        
        let statusFieldTopConstraint = statusField.topAnchor.constraint(equalTo: self.statusView.bottomAnchor, constant: 16)
        let statusFieldLeadingConstraint = statusField.leadingAnchor.constraint(equalTo: self.statusView.leadingAnchor)
        let statusFieldTrailingConstraint = statusField.trailingAnchor.constraint(equalTo: self.statusView.trailingAnchor)
        let statusFieldHeightConstraint = statusField.heightAnchor.constraint(equalToConstant: 40)
        
        let backgroundViewTopConstraint = self.backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let backgroundViewBottomConstraint = self.backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let backgroundViewLeadingConstraint = self.backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let backgroundViewTrailingConstraint = self.backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        let exitButtonHeightConstraint = self.exitButton.heightAnchor.constraint(equalToConstant: 50)
        let exitButtonWidthConstraint = self.exitButton.widthAnchor.constraint(equalToConstant: 50)
        let exitButtonTopAnchor = self.exitButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5)
        let exitButtonTrailingConstraint = self.exitButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5)
        
        NSLayoutConstraint.activate([
            self.profileImageViewTopConstraint, self.profileImageViewLeadingConstraint, self.profileImageViewHeightConstraint, self.profileImageViewWidthConstraint,
            nameLabelTopConstraint, nameLabelTrailingContraint, nameLabelLeadingConstraint, nameLabelHeightConstraint,
            showStatusButtonTopConstraint, showStatusButtonLeadingConstraint, showStatusButtonTrailingConstraint, showStatusButtonHeightContstraint,
            statusViewBottomConstraint, statusViewLeadingConstraint, statusViewTrailingConstraint, statusViewHeightConstraint,
            statusFieldTopConstraint, statusFieldLeadingConstraint, statusFieldTrailingConstraint, statusFieldHeightConstraint,
            backgroundViewTopConstraint, backgroundViewBottomConstraint, backgroundViewLeadingConstraint, backgroundViewTrailingConstraint,
            exitButtonHeightConstraint, exitButtonWidthConstraint, exitButtonTopAnchor, exitButtonTrailingConstraint
                                    ].compactMap{ $0 })
    }

    private func setupTapGestures() {
        self.profileImageTapGestureRecogniser.addTarget(self, action: #selector(self.handleProfileImageTapGesture(_:)))
        self.profileImageView.addGestureRecognizer(self.profileImageTapGestureRecogniser)
        
        self.exitButtonTapGestureRecogniser.addTarget(self, action: #selector(self.handleExitButtonTapGesture(_:)))
        self.exitButton.addGestureRecognizer(self.exitButtonTapGestureRecogniser)
    }
    
    @objc private func handleProfileImageTapGesture(_ gestureRecogniser: UITapGestureRecognizer) {
        guard self.profileImageTapGestureRecogniser === gestureRecogniser else { return }
        self.backgroundView.isHidden = false
        self.backgroundView.alpha = 0.5
        self.view.bringSubviewToFront(self.backgroundView)
        self.view.bringSubviewToFront(self.profileImageView)
        self.profileImageViewLeadingConstraint?.isActive = false
        self.profileImageViewTopConstraint?.isActive = false
        self.profileImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.profileImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.profileImageViewWidthConstraint?.constant = UIScreen.main.bounds.width
        self.profileImageViewHeightConstraint?.constant = UIScreen.main.bounds.width
        self.profileImageView.layer.cornerRadius = 0
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.exitButton.isHidden = false
            self.exitButton.alpha = 1
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            } completion: { _ in
            }
        }
    }
    
    @objc private func handleExitButtonTapGesture(_ gestureRecogniser: UITapGestureRecognizer) {
        guard self.exitButtonTapGestureRecogniser === gestureRecogniser else { return }
        
        self.exitButton.alpha = 0
        self.exitButton.isHidden = true
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        } completion: {_ in
            self.backgroundView.isHidden = true
            self.backgroundView.alpha = 0
            self.profileImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = false
            self.profileImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = false
            self.profileImageViewLeadingConstraint?.isActive = true
            self.profileImageViewTopConstraint?.isActive = true
            self.profileImageViewWidthConstraint?.constant = 120
            self.profileImageViewHeightConstraint?.constant = 120
            self.profileImageView.layer.cornerRadius = 60
            
            UIView.animate(withDuration: 0.5){
                self.view.layoutIfNeeded()
            } completion: { _ in
        
            }
        }
    }
}
