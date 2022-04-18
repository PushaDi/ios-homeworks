//
//  PhotosViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 09.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private var dataSource: [String] = photoAlbum
    
    private let exitButtonTapGestureRecogniser = UITapGestureRecognizer()
    
    private lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.alpha = 0
        backgroundView.isHidden = true
        backgroundView.backgroundColor = .black
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        return backgroundView
    }()
    
    private lazy var largeImageView: UIImageView = {
        let largeImageView = UIImageView()
        largeImageView.isHidden = true
        largeImageView.alpha = 0
        largeImageView.translatesAutoresizingMaskIntoConstraints = false
        largeImageView.contentMode = .scaleAspectFill
        largeImageView.clipsToBounds = true
        return largeImageView
    }()
    
    private lazy var exitButton: UIImageView = {
        let exitButton = UIImageView(image: UIImage(systemName: "multiply.square.fill"))
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.isHidden = true
        exitButton.isUserInteractionEnabled = true
        exitButton.alpha = 0
        
        return exitButton
    }()

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
        self.setupGesture()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func configureView() {
        self.view.addSubview(self.photosCollectionView)
        self.view.addSubview(backgroundView)
        self.view.addSubview(exitButton)
        self.view.addSubview(largeImageView)
        self.title = "Photo Gallery"
        self.navigationController?.navigationBar.isHidden = false
    }

    private func setupConstraints() {
        let photosCollectionViewTopConstraint = self.photosCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let photosCollectionViewLeadingConstraint = self.photosCollectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let photosCollectionViewTrailingConstraint = self.photosCollectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let photosCollectionViewBottomConstraint = self.photosCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        let backgroundViewCenterXConstraint = self.backgroundView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let backgroundViewCenterYConstraint = self.backgroundView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        let backgroundViewHeightConstraint = self.backgroundView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        let backgroundViewWidthConstraint = self.backgroundView.widthAnchor.constraint(equalTo: self.view.widthAnchor)

        let exitButtonHeightConstraint = self.exitButton.heightAnchor.constraint(equalToConstant: 50)
        let exitButtonWidthConstraint = self.exitButton.widthAnchor.constraint(equalToConstant: 50)
        let exitButtonTopAnchor = self.exitButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 5)
        let exitButtonTrailingConstraint = self.exitButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5)
        
        NSLayoutConstraint.activate([
            photosCollectionViewTopConstraint, photosCollectionViewLeadingConstraint, photosCollectionViewTrailingConstraint, photosCollectionViewBottomConstraint,
            exitButtonHeightConstraint, exitButtonWidthConstraint, exitButtonTopAnchor,exitButtonTrailingConstraint,
            backgroundViewWidthConstraint, backgroundViewHeightConstraint, backgroundViewCenterYConstraint, backgroundViewCenterXConstraint
                                    ])
    }
    
    private func setupGesture() {
        self.exitButtonTapGestureRecogniser.addTarget(self, action: #selector(self.handleExitButtonTapGesture(_ :)))
        self.exitButton.addGestureRecognizer(self.exitButtonTapGestureRecogniser)
    }
    
    @objc private func handleExitButtonTapGesture(_ gestureRecogniser: UITapGestureRecognizer) {
        guard self.exitButtonTapGestureRecogniser === gestureRecogniser else { return }
        UIView.animate(withDuration: 0.3) {
            self.exitButton.isHidden = true
            self.exitButton.alpha = 0
            
            
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.backgroundView.isHidden = true
                self.backgroundView.alpha = 0
                self.photosCollectionView.isUserInteractionEnabled = true
                self.largeImageView.isHidden = true
                self.largeImageView.alpha = 0
            } completion: { _ in
            }
        }
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
        let image = UIImage(named: self.dataSource[indexPath.row])
        self.largeImageView.image = image
        
        self.largeImageView.frame = cellFrameInSuperview
        UIView.animate(withDuration: 0.5) {
            NSLayoutConstraint.deactivate(self.largeImageView.constraints)
            self.backgroundView.isHidden = false
            self.backgroundView.alpha = 0.5
            self.photosCollectionView.isUserInteractionEnabled = false
            self.largeImageView.isHidden = false
            self.largeImageView.alpha = 1
            self.largeImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.largeImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            self.largeImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            self.largeImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            self.view.layoutIfNeeded()
        } completion: {_ in
            UIView.animate(withDuration: 0.3) {
                self.exitButton.isHidden = false
                self.exitButton.alpha = 1
            } completion: { _ in
    
            }
        }
    }
    
}

