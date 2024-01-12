//
//  TabBarController.swift
//  testTask
//
//  Created by Нурдаулет on 12.01.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.tintColor = UIColor.shared.darkPink
        tabBar.unselectedItemTintColor = UIColor.lightGray
        
        viewControllers = [
            createViewController(viewInfo: ViewInfo(view: createMainModule(),
                                                    title: "Меню",
                                                    icon: UIImage(named: "menu")!)),
            createViewController(viewInfo: ViewInfo(view: FakeViewController(),
                                                    title: "Контакты",
                                                    icon: UIImage(named: "location")!)),
            createViewController(viewInfo: ViewInfo(view: FakeViewController(),
                                                    title: "Профиль",
                                                    icon: UIImage(named: "profile")!)),
            createViewController(viewInfo: ViewInfo(view: FakeViewController(),
                                                    title: "Корзина",
                                                    icon: UIImage(named: "box")!))
        ]
    }
    
    private func createViewController(viewInfo: ViewInfo) -> UIViewController {
        let view = viewInfo.view
        view.tabBarItem.title = viewInfo.title
        view.tabBarItem.image = viewInfo.icon
        let titleFont = UIFont.defaultFont
        view.tabBarItem.setTitleTextAttributes([ NSAttributedString.Key.font: titleFont], for: .normal)
        return view
    }

    private func createMainModule() -> UIViewController {
        let presenter = MainPresenter()
        let view = MainViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
