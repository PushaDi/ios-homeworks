//
//  ProfileViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 10.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    private lazy var postsTableView: UITableView = {
        let postsTableView = UITableView(frame: .zero, style: .grouped)
        postsTableView.rowHeight = UITableView.automaticDimension
        postsTableView.estimatedRowHeight = 50
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
    
    override func viewWillAppear(_ animated: Bool) {
        if let index = self.postsTableView.indexPathForSelectedRow {
            self.postsTableView.deselectRow(at: index, animated: true)
        }
    }
    
    private func configureSubviews() {
        self.view.backgroundColor = .white
        self.view.addSubview(postsTableView)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupConstraints() {
        let postTableViewTopConstraint = self.postsTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let postTableViewBottomConstraint = self.postsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let postTableViewLeadingConstraint = self.postsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let postTableViewTrailingConstraint = self.postsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        
        NSLayoutConstraint.activate([postTableViewTopConstraint, postTableViewBottomConstraint, postTableViewLeadingConstraint, postTableViewTrailingConstraint])
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell", for: indexPath) as! PhotosTableViewCell
            cell.selectionStyle = .blue
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
            let posts = self.dataSource[indexPath.row]
            let viewModel = PostTableViewCell.ViewModel(username: posts.author, image: UIImage(named: posts.image) ?? UIImage(), description: posts.description, views: posts.views, likes: posts.likes)
            cell.setup(with: viewModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeader")
        }
        
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0{
            return true
        }
        
        return false
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 250
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
    }
    
}
