//
//  TabBarControllerViewController.swift
//  Netology_IB_instruments
//
//  Created by Dmitry Khloptsov on 06.03.2022.
//

import UIKit

final class TabBarController: UITabBarController {
   
    private enum TabBarItems {
        case feed
        case profile
        case gesture
        
        var title: String {
            switch self {
                case .feed:
                    return "Лента"
                case .profile:
                    return "Профиль"
                case .gesture:
                    return "Жесты и касания"
            }
        }
        
        var image: UIImage? {
            switch self {
                case .feed:
                    return UIImage(systemName: "house.circle.fill")
                case .profile:
                    return UIImage(systemName: "person.circle.fill")
                case .gesture:
                    return UIImage(systemName: "hand.tap.fill")
            }
        }
    }
    
    let gestureVC = GestureViewController()
    let logInVC = LogInViewController()
    let feedVC = FeedViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }
    
    private func setupTabBar() {
        
        let itemList: [TabBarItems] = [.feed, .profile, .gesture]
        self.viewControllers = itemList.map({ tabBarItem in
            switch tabBarItem {
                case .feed:
                    return FeedNavigationController(rootViewController: self.feedVC)
                case .profile:
                    return ProfileNavigationController(rootViewController: self.logInVC)
                case .gesture:
                    return ProfileNavigationController(rootViewController: self.gestureVC)
            }
        })
        
        self.viewControllers?.enumerated().forEach({(index, vc) in
            vc.tabBarItem.title = itemList[index].title
            vc.tabBarItem.image = itemList[index].image
            })
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .white
    }
}
