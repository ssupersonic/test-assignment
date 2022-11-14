//
//  PostRepoImpl.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import Foundation
import RxSwift

final class PostRepoImpl: PostsRepo {

    private final let network: Network<Post>
    
    init(network: Network<Post>) {
        self.network = network
    }
    
    func fetchPosts() -> Observable<[Post]> {
        network.fetchObjects(NetworkConfig.postsURL)
    }
}
