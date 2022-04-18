//
//  PhotosViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 09.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private var dataSource: [String] = photoAlbum

    private lazy var photosLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    private lazy var photosCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.photosLayout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.delegate = self
        view.dataSource = self
        view.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.setupConstraints()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func configureView() {
        self.view.addSubview(self.photosCollectionView)
        self.title = "Photo Gallery"
        self.navigationController?.navigationBar.isHidden = false
        
    }

    private func setupConstraints() {
        let photosCollectionViewTopConstraint = self.photosCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let photosCollectionViewLeadingConstraint = self.photosCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let photosCollectionViewTrailingConstraint = self.photosCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let photosCollectionViewBottomConstraint = self.photosCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([photosCollectionViewTopConstraint, photosCollectionViewLeadingConstraint, photosCollectionViewTrailingConstraint, photosCollectionViewBottomConstraint])
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        let photo = UIImage(named: self.dataSource[indexPath.row]) ?? UIImage()
        let viewModel = PhotosCollectionViewCell.ViewModel(image: photo)
        cell.setup(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (UIScreen.main.bounds.width - 8 * 4)/3
        return CGSize(width: side, height: side)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let attributes = collectionView.layoutAttributesForItem(at: indexPath)
        let cellRect = attributes?.frame
        let cellFrameInSuperview = collectionView.convert(cellRect ?? CGRect.zero, to: collectionView.superview)
        
        let backgroundView: UIView = {
            let backgroundView = UIView()
            backgroundView.alpha = 0
            backgroundView.isHidden = true
            backgroundView.backgroundColor = .black
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            return backgroundView
        }()
       
        let image = UIImage(named: self.dataSource[indexPath.row])
        let largeImageView: UIImageView = {
            let imageView = UIImageView(image: image)
            imageView.frame = cellFrameInSuperview
            imageView.isHidden = true
            imageView.alpha = 0
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let exitButton: UIImageView = {
            
            let exitButton = UIImageView(image: UIImage(systemName: "multiply.square.fill"))
            exitButton.translatesAutoresizingMaskIntoConstraints = false
            exitButton.isHidden = true
            exitButton.isUserInteractionEnabled = true
            exitButton.alpha = 0
            
            return exitButton
        }()
        
        self.view.addSubview(exitButton)
        self.view.addSubview(backgroundView)
        self.view.addSubview(largeImageView)
        
        let backgroundViewCenterXConstraint = backgroundView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let backgroundViewCenterYConstraint = backgroundView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        let backgroundViewHeightConstraint = backgroundView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        let backgroundViewWidthConstraint = backgroundView.widthAnchor.constraint(equalTo: self.view.widthAnchor)

        let exitButtonHeightConstraint = exitButton.heightAnchor.constraint(equalToConstant: 50)
        let exitButtonWidthConstraint = exitButton.widthAnchor.constraint(equalToConstant: 50)
        let exitButtonTopAnchor = exitButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5)
        let exitButtonTrailingConstraint = exitButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5)
        
        NSLayoutConstraint.activate([exitButtonHeightConstraint, exitButtonWidthConstraint, exitButtonTopAnchor,exitButtonTrailingConstraint, backgroundViewWidthConstraint, backgroundViewHeightConstraint, backgroundViewCenterYConstraint, backgroundViewCenterXConstraint])
        
        UIView.animate(withDuration: 0.5) {
            NSLayoutConstraint.deactivate(largeImageView.constraints)
            backgroundView.isHidden = false
            backgroundView.alpha = 0.5
            self.photosCollectionView.isUserInteractionEnabled = false
            largeImageView.isHidden = false
            largeImageView.alpha = 1
            largeImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            largeImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            largeImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            largeImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            largeImageView.contentMode = .scaleAspectFill
            largeImageView.clipsToBounds = true
            self.view.layoutIfNeeded()
        } completion: {_ in
            UIView.animate(withDuration: 0.3) {
                exitButton.isHidden = false
                exitButton.alpha = 1
            } completion: { _ in
    
            }
        }
    }
    
}

