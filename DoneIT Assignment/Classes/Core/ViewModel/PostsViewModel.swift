//
//  PostsViewModel.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import Foundation
import RxSwift

protocol PostModel: BaseTableViewViewModel {
    func cellModel(at index: Int) -> Post?
}

final class PostsViewModel {
    
    let user: User
    
    var onUpdateTable: (() -> Void)?
    
    init(user: User) {
        self.user = user
    }
}

extension PostsViewModel: PostModel {

    func numberOfRows() -> Int {
        return user.posts?.count ?? 0
    }
    
    func selectElement(at index: Int) {
        print("selectElement at - \(index)")
    }
    
    func cellModel(at index: Int) -> Post? {
        return user.posts?[index]
    }
}
