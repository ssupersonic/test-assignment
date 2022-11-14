//
//  UsersTableViewController.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import UIKit
import RxSwift
import Swinject

class UsersTableViewController: UITableViewController {

    private final let disposeBag: DisposeBag = DisposeBag()
    var userViewModel: UserViewModel!
    
    private let kCellHeight: CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

private extension UsersTableViewController {
    
    func setup() {
        title = NSLocalizedString("users_title", comment: "")
     
        setupTableView()
        setupViewModel()
    }
    
    func setupTableView() {
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
    }
    
    func setupViewModel() {
        userViewModel.onUpdateTable = {
            self.tableView.reloadData()
        }
        
        userViewModel.selectedUser = { user in
            self.present(user: user)
        }
    }
}

extension UsersTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UserTableViewCell.dequeue(in: tableView, at: indexPath)
        let user = userViewModel.cellModel(at: indexPath.row)
        cell.configure(with: user)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        userViewModel.selectElement(at: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kCellHeight
    }
}

extension UsersTableViewController {
    
    func present(user: User) {
        let postViewModel = PostsViewModel(user: user)
        let postsController = PostsTableViewController(postViewModel: postViewModel)
        navigationController?.pushViewController(postsController, animated: true)
        
    }
}
