//
//  PostFromCellViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 18.04.2022.
//

import UIKit

class PostFromCellViewController: UIViewController {
    
    struct ViewModel: ViewModelProtocol {
        let username: String
        let image: UIImage
        let description: String
        let views: Int
        var likes: Int
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSubviews()
        self.setupConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
   
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var descriptionLabel: UILabel = {
        let descriptionView = UILabel()
        descriptionView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionView.textColor = .systemGray
        descriptionView.numberOfLines = 0
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        return descriptionView
    }()

    private lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likesLabel.textColor = .black
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.isUserInteractionEnabled = true
        return likesLabel
    }()

    private lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        viewsLabel.textColor = .black
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()



    private func configureSubviews() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = false
        self.view.addSubview(self.usernameLabel)
        self.view.addSubview(self.postImageView)
        self.view.addSubview(self.descriptionLabel)
        self.view.addSubview(self.likesLabel)
        self.view.addSubview(self.viewsLabel)
    }
    
    private func setupConstraints() {
        let usernameLabelTopConstraint = self.usernameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16)
        let usernameLabelLeadingConstraint = self.usernameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let usernameLabelTrailingConstraint = self.usernameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
//        let usernameLabelHeightConstraint = self.usernameLabel.heightAnchor.constraint(equalToConstant: 50)

        let imageViewTopConstraint = self.postImageView.topAnchor.constraint(equalTo: self.usernameLabel.bottomAnchor, constant: 12)
        let imageViewHeightConstraint = self.postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        let imageViewWidthConstraint = self.postImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        let imageViewLeadingConstraint = self.postImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let imageViewTrailingConstraint = self.postImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)

        let descriptionTopConstraint = self.descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16)
        let descriptionLeadingConstraint = self.descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let descriptionTrailingConstraint = self.descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)

        let likesLabelTopConstraint = self.likesLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16)
        let likesLabelLeadingConstraint = self.likesLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)

        let viewsLabelTopConstraint = self.viewsLabel.topAnchor.constraint(equalTo: self.likesLabel.topAnchor)
        let viewsLabelTrailingConstraint = self.viewsLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)


        NSLayoutConstraint.activate([
            usernameLabelTopConstraint, usernameLabelLeadingConstraint, usernameLabelTrailingConstraint,
            imageViewTopConstraint, imageViewWidthConstraint, imageViewHeightConstraint, imageViewLeadingConstraint,imageViewTrailingConstraint,
            descriptionTopConstraint, descriptionLeadingConstraint, descriptionTrailingConstraint,
            likesLabelTopConstraint, likesLabelLeadingConstraint,
            viewsLabelTopConstraint, viewsLabelTrailingConstraint
        ])
    }
}

extension PostFromCellViewController: Setupable {
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }

        self.usernameLabel.text = viewModel.username
        self.descriptionLabel.text = viewModel.description
        self.postImageView.image = viewModel.image
        self.viewsLabel.text = "Views:" + String(viewModel.views)
        self.likesLabel.text = "Likes:" + String(viewModel.likes)
    }
}
