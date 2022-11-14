//
//  ContainerManager.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import Foundation
import Swinject

final class ContainerManager {
    static let shared = ContainerManager()
 
    let container = Container() { container in
        container.register(Network.self) { _ in Network<User>.init() }
        container.register(Network.self) { _ in Network<Post>.init() }
        
        container.register(UsersRepo.self) { resolver in
            let nationalityRepo = UserRepoImpl(network: resolver.resolve(Network<User>.self)!)
            return nationalityRepo
        }
        
        container.register(UsersUseCase.self) { resolver in
            UsersUseCase(postsRepo: resolver.resolve(PostsRepo.self)!, usersRepo: resolver.resolve(UsersRepo.self)!)
        }
        
        container.register(UserViewModel.self) { resolver in
            UserViewModel(usersUseCase: resolver.resolve(UsersUseCase.self)!)
        }

        container.register(PostsRepo.self) { resolver in
            PostRepoImpl(network: resolver.resolve(Network<Post>.self)!)
        }
    }
}
