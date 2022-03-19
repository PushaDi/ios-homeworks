//
//  InfoViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 06.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupButton()
    }
    
    private lazy var alertButton: UIButton = {
        let alertButton = UIButton(frame: .zero)
        return alertButton
    }()
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.title = "Информация"
    }
    
    private func setupButton() {
        alertButton.setTitle("Внимание!", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.layer.cornerRadius = 12
        alertButton.backgroundColor = .systemBlue
    
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        alertButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        view.addSubview(alertButton)
        
        let bottomConstraint = self.alertButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10.0)
        let leadingConstraint = self.alertButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10.0)
        let trailingConstraint = self.alertButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10.0)
        let heightConstraint = self.alertButton.heightAnchor.constraint(equalToConstant: 50.0)
        
        NSLayoutConstraint.activate([bottomConstraint, leadingConstraint, trailingConstraint, heightConstraint])
    }
    
    @objc private func didTapButton() {
        let alertController = UIAlertController(title: "Осторожно!", message: "Нажмите на одну из кнопок ниже, чтобы продолжить", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Хорошо", style: .default, handler: {action in okayChoice()}))
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel , handler: {action in cancelChoice()}))
        
        func okayChoice() {
            print("Нажали 'Хорошо' ")
        }
        
        func cancelChoice() {
            print("Нажали 'Отмена' ")
        }
        self.present(alertController, animated: true, completion: nil)
    }
}
