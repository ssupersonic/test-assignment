//
//  UserRepoImpl.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import Foundation
import RxSwift

final class UserRepoImpl: UsersRepo {

    private final let network: Network<User>
    
    init(network: Network<User>) {
        self.network = network
    }
    
    func fetchUsers() -> Observable<[User]> {
        network.fetchObjects(NetworkConfig.usersURL)
    }
}
