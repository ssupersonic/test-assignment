//
//  PostsCoordinator.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import UIKit

final class PostsCoordinator: Coordinator {
    
    private(set) var childCoordinator: [Coordinator] = []
    
    private let navigationController: UINavigationController
    private let postViewModel: PostsViewModel
    
    init(navigationController: UINavigationController, postViewModel: PostsViewModel) {
        self.navigationController = navigationController
        self.postViewModel = postViewModel
    }
    
    func start() {
        let postsTableViewController = PostsTableViewController(postViewModel: postViewModel)
        navigationController.pushViewController(postsTableViewController, animated: true)
    }
}
