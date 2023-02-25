//
//  ViewController.swift
//  Netflix Clone
//
//  Created by macbook pro on 19.02.2023.
//

import UIKit

/// Burayı tabBar olarak değiştirdik.
class MainTapbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // Tek tek tabBar oluşturduk.
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcomingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        vc1.title = "Home"
        vc2.title = "Upcoming"
        vc3.title = "Search"
        vc4.title = "Download"
        
        view.tintColor = .label
        
        // Sayfaları tabBar' a ekledik.
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}
