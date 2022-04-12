//
//  PostTableViewCell.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 26.03.2022.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    struct ViewModel: ViewModelProtocol {
        let username: String
        let image: UIImage
        let description: String
        let views: Int
        let likes: Int
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
        return likesLabel
    }()

    private lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        viewsLabel.textColor = .black
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureSubviews()
        self.setupConstraints()
       }

       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

       override func prepareForReuse() {
           super.prepareForReuse()
           self.usernameLabel.text = nil
           self.descriptionLabel.text = nil
           self.viewsLabel.text = nil
           self.likesLabel.text = nil
           self.postImageView.image = nil
       }

    private func configureSubviews() {
        self.contentView.addSubview(self.usernameLabel)
        self.contentView.addSubview(self.postImageView)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.likesLabel)
        self.contentView.addSubview(self.viewsLabel)
    }
    private func setupConstraints() {
        let usernameLabelTopConstraint = self.usernameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16)
        let usernameLabelLeadingConstraint = self.usernameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let usernameLabelTrailingConstraint = self.usernameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
//        let usernameLabelHeightConstraint = self.usernameLabel.heightAnchor.constraint(equalToConstant: 50)

        let imageViewTopConstraint = self.postImageView.topAnchor.constraint(equalTo: self.usernameLabel.bottomAnchor, constant: 12)
        let imageViewHeightConstraint = self.postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        let imageViewWidthConstraint = self.postImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        let imageViewLeadingConstraint = self.postImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let imageViewTrailingConstraint = self.postImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)

        let descriptionTopConstraint = self.descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16)
        let descriptionLeadingConstraint = self.descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let descriptionTrailingConstraint = self.descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)

        let likesLabelTopConstraint = self.likesLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16)
        let likesLabelLeadingConstraint = self.likesLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)

        let viewsLabelTopConstraint = self.viewsLabel.topAnchor.constraint(equalTo: self.likesLabel.topAnchor)
        let viewsLabelTrailingConstraint = self.viewsLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let viewsLabelBottomConstraint = self.viewsLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5)


        NSLayoutConstraint.activate([
            usernameLabelTopConstraint, usernameLabelLeadingConstraint, usernameLabelTrailingConstraint,
            imageViewTopConstraint, imageViewWidthConstraint, imageViewHeightConstraint, imageViewLeadingConstraint,imageViewTrailingConstraint,
            descriptionTopConstraint, descriptionLeadingConstraint, descriptionTrailingConstraint,
            likesLabelTopConstraint, likesLabelLeadingConstraint,
            viewsLabelTopConstraint, viewsLabelTrailingConstraint, viewsLabelBottomConstraint
        ])
    }
}

extension PostTableViewCell: Setupable {
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }

        self.usernameLabel.text = viewModel.username
        self.descriptionLabel.text = viewModel.description
        self.postImageView.image = viewModel.image
        self.viewsLabel.text = "Views:" + String(viewModel.views)
        self.likesLabel.text = "Likes:" + String(viewModel.likes)
    }
}

