//
//  PhotosViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 09.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {

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
        if let photo = UIImage(named: "photo\(indexPath.item)") {
            cell.setup(with: photo)
        } else {
            cell.setup(with: UIImage(systemName: "photo")!)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (UIScreen.main.bounds.width - 8 * 4)/3
        return CGSize(width: side, height: side)
    }
    
}

