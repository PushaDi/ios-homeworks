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
        postsTableView.estimatedRowHeight = 400
        postsTableView.dataSource = self
        postsTableView.delegate = self
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        postsTableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeader")
        postsTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosCell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let posts = self.dataSource[indexPath.row]
        let viewModel = PostTableViewCell.ViewModel(username: posts.author, image: UIImage(named: posts.image) ?? UIImage(), description: posts.description, views: posts.views, likes: posts.likes)
        cell.setup(with: viewModel)
        cell.layoutSubviews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileHeaderView()
    }
    
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
