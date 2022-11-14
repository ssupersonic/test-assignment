//
//  UserViewModel.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import Foundation
import RxSwift

protocol UserModel: BaseTableViewViewModel {
    var selectedUser: ((User) -> Void)? { get set }
    
    func cellModel(at index: Int) -> User
}

final class UserViewModel {
    
    private let disposeBag: DisposeBag = DisposeBag()
    
    private let usersUseCase: UsersUseCase
    
    var coordinator: UsersCoordinator?
    
    
    var users: [User] = []
    
    var onUpdateTable: (() -> Void)?
    var selectedUser: ((User) -> Void)?
    
    init(usersUseCase: UsersUseCase) {
        self.usersUseCase = usersUseCase
    }
    
    func fetchUsers() {
        usersUseCase.fetchUsers()
            .subscribe(onNext: {
                self.users = $0
            }, onError: {
                print($0.localizedDescription)
            }, onCompleted: {
                self.updateTableView()
            }
        ).disposed(by: disposeBag)
    }
}

extension UserViewModel: UserModel {
    
    func numberOfRows() -> Int {
        return users.count
    }
    
    func cellModel(at index: Int) -> User {
        return users[index]
    }
    
    func selectElement(at index: Int) {
        present(user: users[index])
    }
}

private extension UserViewModel {
    
    func updateTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.onUpdateTable?()
        }
    }
    
    func present(user: User) {
        coordinator?.presentPosts(for: user)
    }
}
