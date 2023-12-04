//
//  ViewController.swift
//  RickNMortyWiki
//
//  Created by Pongthorn Chumpoo on 3/12/2566 BE.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUPTab()
    }

    private func setUPTab(){
        let characterVC = CharacterViewController()
        let locationVC =  LocationViewController()
        let episodeVC = EpisodeViewController()
        let settingVC = SettingViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        settingVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 =  UINavigationController(rootViewController: characterVC)
        let nav2 =  UINavigationController(rootViewController: locationVC)
        let nav3 = UINavigationController(rootViewController: episodeVC)
        let nav4 = UINavigationController(rootViewController: settingVC)
        
        for nav in [nav1,nav2,nav3,nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        
        nav1.tabBarItem = UITabBarItem(title: "charactes", image: UIImage(systemName: "person"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "locations", image: UIImage(systemName: "globe"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "episodes", image: UIImage(systemName: "play.tv"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "settings", image: UIImage(systemName: "gear"), tag: 4)
        
        setViewControllers([nav1,nav2,nav3,nav4], animated: true)
    }

}

