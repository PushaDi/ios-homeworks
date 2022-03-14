//
//  FeedViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 06.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    struct postStruct {
        let postTitle: String
    }

//    private lazy var postButton: UIButton = {
//        let postButton = UIButton(frame: .zero)
//        return postButton
//    }()
    
    private var customStackView = UIStackView()
    
    private var firstButton: UIButton = UIButton()
    private var secondButton: UIButton = UIButton()
    
    private func setupStackView() {
        self.view.addSubview(customStackView)
        customStackView.axis = .vertical
        customStackView.spacing = 10
        
        customStackView.translatesAutoresizingMaskIntoConstraints = false
        
        customStackView.addArrangedSubview(self.firstButton)
        customStackView.addArrangedSubview(self.secondButton)
        
        let centerXConstraint = customStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let centerYConstraint = customStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        NSLayoutConstraint.activate([centerXConstraint, centerYConstraint])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupStackView()
//        self.setupButton()
    }
    
    private func setupView() {
        self.title = "Лента"
        self.view.backgroundColor = .systemMint
        
    }

//    private func setupButton() {
//        postButton.setTitle("Посмотреть пост", for: .normal)
//        postButton.setTitleColor(.white, for: .normal)
//        postButton.layer.cornerRadius = 12
//        postButton.backgroundColor = .systemBlue
//
//        postButton.translatesAutoresizingMaskIntoConstraints = false
//        postButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//
//        view.addSubview(postButton)
//
//        let bottomConstraint = self.postButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10.0)
//        let leadingConstraint = self.postButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10.0)
//        let trailingConstraint = self.postButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10.0)
//        let heightConstraint = self.postButton.heightAnchor.constraint(equalToConstant: 50.0)
//
//        NSLayoutConstraint.activate([bottomConstraint, leadingConstraint, trailingConstraint, heightConstraint])
//    }
//    @objc private func didTapButton(_ sender: UIButton!) {
//        let postVc = PostViewController()
//        let newPost = self.createPost(postTitle: "Интересная заметка")
//        postVc.text = newPost.postTitle
//        self.navigationController?.pushViewController(postVc, animated: true)
//    }
    
    private func createPost(postTitle: String) -> postStruct {
        return postStruct(postTitle: postTitle)
    }
}
