//
//  PostViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 06.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var text: String? = "Пост"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewController()
        self.setupNavBarButton()
    }
    
    private func setupViewController() {
        self.view.backgroundColor = .systemGray2
    }
    
    private func setupNavBarButton() {
        let infoButton = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(didTapButton))
        self.navigationItem.setRightBarButton(infoButton, animated: true)
    }
    
    @objc private func didTapButton() {
        let infoVc = InfoViewController()
        self.present(infoVc, animated: true, completion: nil)
    }
}
