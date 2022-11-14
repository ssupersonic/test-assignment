//
//  UsersCoordinator.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import UIKit

final class UsersCoordinator: Coordinator {
    
    private(set) var childCoordinator: [Coordinator] = []
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let usersTableViewController = UsersTableViewController()
        let userViewModel = ContainerManager.shared.container.resolve(UserViewModel.self)!
        userViewModel.coordinator = self
        userViewModel.fetchUsers()
        usersTableViewController.userViewModel = userViewModel
        navigationController.setViewControllers([usersTableViewController], animated: false)
    }
    
    func presentPosts(for user: User) {
        let postViewModel = PostsViewModel(user: user)
        let postsCoordinator = PostsCoordinator(navigationController: navigationController, postViewModel: postViewModel)
        childCoordinator.append(postsCoordinator)
        postsCoordinator.start()
    }
}
