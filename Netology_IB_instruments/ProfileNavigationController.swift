//
//  ProfileNavigationControllerViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 06.03.2022.
//

import UIKit

class ProfileNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavBar()
    }
    
    private func setupNavBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navBarAppearance.backgroundColor = .white
        self.navigationBar.isTranslucent = false
        self.navigationBar.isHidden = true
        self.navigationBar.standardAppearance = navBarAppearance
        self.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
