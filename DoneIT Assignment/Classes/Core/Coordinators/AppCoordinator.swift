//
//  AppCoordinator.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
    
    private(set) var childCoordinator: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let usersController = UsersCoordinator(navigationController: navigationController)
        childCoordinator.append(usersController)
        usersController.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

