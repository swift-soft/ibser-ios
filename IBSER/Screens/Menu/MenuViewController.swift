//
//  MenuViewController.swift
//  Rickapp
//
//  Created by Wojciech Mokwiński on 30/08/2023.
//

import UIKit

protocol ScrollableToTop {
    func scrollToTop()
}

class MenuViewController: UITabBarController, UITabBarControllerDelegate {
    private var lastSelectedViewController: UIViewController? = nil
    private var isTabBarDisabled = false
    private let selectionIndicator = UIView()
    private var itemWidth: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        setupSelectionIndicator()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTabBarNavigationBar()
    }
    
    private func setupSelectionIndicator() {
        itemWidth = tabBar.frame.width / CGFloat(tabBar.items!.count)
        selectionIndicator.backgroundColor = .systemRed
        tabBar.addSubview(selectionIndicator)
        selectionIndicator.frame = CGRect(x: 0, y: 0, width: itemWidth, height: 3)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController) {
            let xOrigin = CGFloat(selectedIndex) * itemWidth
            let selectionIndicatorFrame = CGRect(x: xOrigin, y: 0, width: itemWidth, height: 3)
            
            UIView.animate(withDuration: 0.3) {
                self.selectionIndicator.frame = selectionIndicatorFrame
            }
        }
        
        guard let scrollableController = viewController as? ScrollableToTop else { return }
        
        if !isTabBarDisabled, viewController == lastSelectedViewController {
            isTabBarDisabled = true
            scrollableController.scrollToTop()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.isTabBarDisabled = false
            }
        }
        lastSelectedViewController = viewController
    }
    
    private func setupControllers() {
        
        let dashboardViewController = DashboardViewController()
        let dashboardViewModel = DashboardViewModel()
        dashboardViewController.viewModel = dashboardViewModel
        dashboardViewController.tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage.getImage(.houseIcon), tag: 0)
        
        let historyViewController = HistoryViewController()
        let historyViewModel = HistoryViewModel()
        historyViewController.viewModel = historyViewModel
        historyViewController.tabBarItem = UITabBarItem(title: "History", image: UIImage.getImage(.transcactionIcon), tag: 1)
        
        let statisticsViewController = StatisticsViewController()
        let statisticsViewModel = StatisticsViewModel()
        statisticsViewController.viewModel = statisticsViewModel
        statisticsViewController.tabBarItem = UITabBarItem(title: "Statistics", image: UIImage.getImage(.walletIcon), tag: 2)
        
        let profileViewController = ProfileViewController()
        let profileViewModel = ProfileViewModel()
        profileViewController.viewModel = profileViewModel
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.getImage(.profileIcon), tag: 3)
        
        self.viewControllers = [dashboardViewController, historyViewController, statisticsViewController, profileViewController]
    }
    
    private func configureTabBarNavigationBar() {
        tabBar.barTintColor = .systemRed
        tabBar.tintColor = .systemRed
        tabBar.backgroundColor = .white
    }
}



