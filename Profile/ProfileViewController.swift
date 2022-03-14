//
//  ProfileViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 10.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.profileHeaderView.frame = self.view.safeAreaLayoutGuide.layoutFrame
    }
    
    private func setupView() {
        self.view.backgroundColor = .lightGray
        self.title = "Профиль"
        self.view.addSubview(profileHeaderView)
        
    }
}
