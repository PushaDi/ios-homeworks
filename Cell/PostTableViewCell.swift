//
//  PostTableViewCell.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 26.03.2022.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
    }()
    
    private lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private lazy var descriptionTextView: UILabel = {
        let descriptionView = UILabel()
        descriptionView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionView.textColor = .systemGray
        descriptionView.numberOfLines = 0
        return descriptionView
    }()
    
    private lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likesLabel.textColor = .black
        return likesLabel
    }()
    
    private lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        viewsLabel.textColor = .black
        return viewsLabel
    }()
    private func configureSubviews() {
    }
    private func setupConstraints() {
    }
}
