//
//  ProfileView.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 25.02.2022.
//
import UIKit

class ProfileView: UIView {
    @IBOutlet var ProfileView: ProfileView!
    @IBOutlet weak var UserPhoto: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserBirthDate: UILabel!
    @IBOutlet weak var UserCity: UILabel!
    @IBOutlet weak var UserBio: UITextView!
    
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
        guard let view = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? UIView else {
            return UIView()
        }
        
        return view
    }
}
