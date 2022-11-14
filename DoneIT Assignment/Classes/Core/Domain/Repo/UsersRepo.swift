//
//  UsersRepo.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import Foundation
import RxSwift

protocol UsersRepo {
    func fetchUsers() -> Observable<[User]>
}

