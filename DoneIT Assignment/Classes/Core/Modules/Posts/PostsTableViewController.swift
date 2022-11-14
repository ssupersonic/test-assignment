//
//  PostsTableViewController.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import UIKit

class PostsTableViewController: UITableViewController {

    let postViewModel: PostsViewModel
    
    private let kHeaderHeight: CGFloat = 200
    private let kCellHeight: CGFloat = 80
    
    init(postViewModel: PostsViewModel) {
        self.postViewModel = postViewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

private extension PostsTableViewController {
    
    func setup() {
        setupTableView()
        setupTableViewHeader()
    }
    
    func setupTableView() {
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
    }
    
    func setupTableViewHeader() {
        let cardImageView = UIImageView()
        cardImageView.clipsToBounds = true
        cardImageView.contentMode = .scaleAspectFill
        cardImageView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: kHeaderHeight)
        tableView?.tableHeaderView = cardImageView
        
        if let url = postViewModel.user.thumbnailUrl {
            cardImageView.sd_setImage(with: URL(string: url), placeholderImage: #imageLiteral(resourceName: "avatar_placeholder"))
        }
    }
}

extension PostsTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostTableViewCell.dequeue(in: tableView, at: indexPath)
        cell.selectionStyle = .none
        
        if let post = postViewModel.cellModel(at: indexPath.row) {
            cell.configure(with: post)
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kCellHeight
    }
}
