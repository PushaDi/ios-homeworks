//
//  ProfileViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 10.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var postsTableView: UITableView = {
        let postsTableView = UITableView()
        postsTableView.dataSource = self
        postsTableView.delegate = self
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        return postsTableView
    }()
    
    private var dataSource: [PostStruct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSubviews()
        self.setupConstraints()
    }
    
    private func configureSubviews() {
        self.view.addSubview(postsTableView)
    }
    
    private func setupConstraints() {
        let postTableViewTopConstraint = self.postsTableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let postTableViewBottomConstraint = self.postsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let postTableViewLeadingConstraint = self.postsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let postTableViewTrailingConstraint = self.postsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        NSLayoutConstraint.activate([postTableViewTopConstraint, postTableViewBottomConstraint, postTableViewLeadingConstraint, postTableViewTrailingConstraint])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return PostTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileHeaderView()
    }
}
