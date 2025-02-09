//
//  SceneDelegate.swift
//  UserManagementApp
//
//  Created by Yusuf Muhammet Yıldırım on 2/9/25.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Properties
    
    var window: UIWindow?

    // MARK: - Lifecycle
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        setupRootViewController(with: windowScene)
    }
    
    // MARK: - Private Methods
    
    private func setupRootViewController(with windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        
        let userListVC = UserListViewController()
        let navController = UINavigationController(rootViewController: userListVC)
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
