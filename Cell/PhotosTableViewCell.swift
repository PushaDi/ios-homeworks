//
//  PhotosTableViewCell.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 05.04.2022.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    private lazy var photosTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let arrowView = UIImageView(image: UIImage(systemName: "arrow.right"))
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        return arrowView
        
    }()
    
    private lazy var previewStackView: UIStackView = {
        let previewStackView = UIStackView()
        previewStackView.translatesAutoresizingMaskIntoConstraints = false
        previewStackView.axis = .horizontal
        previewStackView.spacing = 8
        return previewStackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func fillInStackView(){
        for photoName in ["photo0","photo1", "photo2", "photo3"] {
            let photoView = UIImageView(image: UIImage(named: photoName))
            photoView.translatesAutoresizingMaskIntoConstraints = false
            photoView.contentMode = .scaleAspectFill
            photoView.layer.cornerRadius = 6
            photoView.clipsToBounds = true
            photoView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48)/4).isActive = true
            photoView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48)/4).isActive = true
            self.previewStackView.addArrangedSubview(photoView)
        }
    }
    
    private func configureSubviews() {
        self.contentView.addSubview(self.photosTextLabel)
        self.contentView.addSubview(self.arrowImageView)
        self.fillInStackView()
        self.contentView.addSubview(self.previewStackView)
    }
    
    private func setupConstraints() {
        let photosTextLabelTopConstraint = self.photosTextLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12)
        let photosTextLabelLeadingConstraint = self.photosTextLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12)
        
        let photosTextLabelConstraints = [photosTextLabelTopConstraint, photosTextLabelLeadingConstraint]
        
        let arrowImageViewCenterYConstraint =  self.arrowImageView.centerYAnchor.constraint(equalTo: self.photosTextLabel.centerYAnchor)
        let arrowImageViewTrailingConstraint = self.arrowImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12)
        
        let arrowImageViewConstraints = [arrowImageViewCenterYConstraint, arrowImageViewTrailingConstraint]
        
        let previewStackViewTopConstraint = self.previewStackView.topAnchor.constraint(equalTo: self.photosTextLabel.bottomAnchor, constant: 12)
        let previewStackViewLeadingConstraint = self.previewStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12)
        let previewStackViewTrailingConstraint = self.previewStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12)
        let previewStackViewBottomConstraint = self.previewStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12)
        
        let previewStackViewConstraints = [previewStackViewTopConstraint, previewStackViewLeadingConstraint, previewStackViewTrailingConstraint, previewStackViewBottomConstraint]
        
        NSLayoutConstraint.activate(photosTextLabelConstraints + arrowImageViewConstraints + previewStackViewConstraints)
    }
}
