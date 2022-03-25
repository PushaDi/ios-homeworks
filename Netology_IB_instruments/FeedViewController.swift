//
//  FeedViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 06.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    
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
        
        self.setupButtons()
        
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
    
    private func createPost(postTitle: String) -> PostStruct {
        return PostStruct(postTitle: postTitle)
    }
    
    private func setupButtons() {
        self.firstButton.backgroundColor = .systemBlue
        self.secondButton.backgroundColor = .systemRed
        
        self.firstButton.setTitle("Первый пост", for: .normal)
        self.secondButton.setTitle("Второй пост", for: .normal)
        
        firstButton.addTarget(self, action: #selector(didTapFirstButton), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(didTapSecondButton), for: .touchUpInside)
    }
    
    @objc private func didTapFirstButton() {
        let postVc = PostViewController()
        postVc.title = "Первый пост"
        
        self.navigationController?.pushViewController(postVc, animated: true)
    }
    
    @objc private func didTapSecondButton() {
        let postVc = PostViewController()
        postVc.title = "Второй пост"
        
        self.navigationController?.pushViewController(postVc, animated: true)
    }
}
