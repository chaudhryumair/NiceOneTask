//
//  SceneDelegate.swift
//  NiceOneTask
//
//  Created by Chaudhry Umair on 30/12/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
          let window = UIWindow(windowScene: windowScene)
          let controller = ShoppingBasketVC()
          window.rootViewController = controller
          self.window = window
          window.makeKeyAndVisible()
        }
        create_TabBar()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

extension SceneDelegate {
    func create_TabBar(){
        
        let tabbar = UITabBarController()
        let firstVC = UINavigationController(rootViewController: ShoppingBasketVC())
        let secondVC = UINavigationController(rootViewController: ShoppingBasketVC())
        let thirdVC = UINavigationController(rootViewController: ShoppingBasketVC())
        let fourVC = UINavigationController(rootViewController: ShoppingBasketVC())
        let fiveVC = UINavigationController(rootViewController: ShoppingBasketVC())

        fiveVC.tabBarItem = UITabBarItem(title: "الحساب", image: UIImage(named: "imgAccount"),selectedImage: UIImage(named: "imgAccount"))
        fourVC.tabBarItem = UITabBarItem(title: "الحقيبة", image: UIImage(systemName: "person"),selectedImage: UIImage(systemName: "person.fill"))
        thirdVC.tabBarItem = UITabBarItem(title: "الماركات", image: UIImage(systemName: "house"),selectedImage: UIImage(systemName: "house.fill"))
        secondVC.tabBarItem = UITabBarItem(title: "الأقسام", image: UIImage(systemName: "person"),selectedImage: UIImage(systemName: "person.fill"))
        firstVC.tabBarItem = UITabBarItem(title: "الرئيسية", image: UIImage(systemName: "house"),selectedImage: UIImage(systemName: "house.fill"))
        tabbar.tabBar.tintColor = .black
        tabbar.tabBar.barTintColor = UIColor.white // your color


        tabbar.viewControllers = [firstVC, secondVC, thirdVC, fourVC, fiveVC]
        window?.rootViewController = tabbar
    }
}

