//
//  PostsRepo.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import Foundation
import RxSwift

protocol PostsRepo {
    func fetchPosts() -> Observable<[Post]>
}
