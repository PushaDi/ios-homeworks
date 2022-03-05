//
//  ProfileView.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 25.02.2022.
//
import UIKit

class ProfileView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    private func setupView() {
        let view = self.loadViewFromXib()
        view.frame = self.bounds
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    

    private func loadViewFromXib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("ProfileView", owner: self, options: nil)?.first as? UIView else {
            return UIView()
        }
        
        return view
    }
}
