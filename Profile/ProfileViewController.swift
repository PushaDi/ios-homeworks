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
        postsTableView.rowHeight = UITableView.automaticDimension
        postsTableView.dataSource = self
        postsTableView.delegate = self
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        postsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        return postsTableView
    }()
    
    private var dataSource: [PostStruct] = postsCollection
    
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
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                    return cell
        }
        
        let posts = self.dataSource[indexPath.row]
        let viewModel = PostTableViewCell.ViewModel(username: posts.author, imageName: posts.image, description: posts.description, views: posts.views, likes: posts.likes)
                cell.setup(with: viewModel)
                return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileHeaderView()
    }
}
