//
//  PhotosCollectionViewCell.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 11.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    struct ViewModel: ViewModelProtocol {
        let image: UIImage
    }
    private lazy var photoView: UIImageView = {
        let photoView = UIImageView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.contentMode = .scaleAspectFill
        photoView.clipsToBounds = true
        return photoView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubview() {
        self.contentView.addSubview(self.photoView)
        
        let centerXConstraint = self.photoView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let centerYConstraint = self.photoView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        let heightConstraint = self.photoView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor)
        let widthConstraint = self.photoView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)
        
        NSLayoutConstraint.activate([centerXConstraint, centerYConstraint, heightConstraint, widthConstraint])
    }
}

extension PhotosCollectionViewCell: Setupable {
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        self.photoView.image = viewModel.image
    }
}
