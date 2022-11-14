//
//  UsersUseCase.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import Foundation
import RxSwift

final class UsersUseCase {
    
    private final let postsRepo: PostsRepo
    private final let usersRepo: UsersRepo
    
    init(postsRepo: PostsRepo, usersRepo: UsersRepo) {
        self.postsRepo = postsRepo
        self.usersRepo = usersRepo
    }
    
    func fetchUsers() -> Observable<[User]> {
        Observable.zip(postsRepo.fetchPosts(),usersRepo.fetchUsers()).map({ posts, users  in
            
            var tempUsers: [User] = []
            
            users.uniqued().forEach({ user in
                var tempUser = user
                tempUser.posts = posts.uniqued().filter({ $0.userId == user.id })
                
                tempUsers.append(tempUser)
            })
            
            return tempUsers
        })
        
    }
}
