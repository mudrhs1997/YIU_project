//
//  ViewController.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/04.
//

import UIKit

class HomeViewController: UITabBarController {

    var teamInfo: TeamModel? {
        didSet {
            
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setUpControllers()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = teamInfo?.name
        navigationItem.hidesBackButton = true
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setUpControllers() {
        let home = TeamSelectViewController()
        home.title = "Home"
        let schedule = ScheduleViewController()
        schedule.title = "Schedule"
        let stats = StatsViewController()
        stats.title = "Stats"
        
        home.navigationItem.largeTitleDisplayMode = .always
        schedule.navigationItem.largeTitleDisplayMode = .always
        stats.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: schedule)
        let nav3 = UINavigationController(rootViewController: stats)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Schedule", image: UIImage(systemName: "house"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Stats", image: UIImage(systemName: "house"), tag: 3)
        
        setViewControllers([nav1, nav2, nav3], animated: true)
    }

}

