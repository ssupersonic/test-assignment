//
//  UserTableViewCell.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell {

    let usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let postsCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        
        return stack
    }()
    
    let cotentStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        
        return stack
    }()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupViews()
    }
    
    required init?(coder: NSCoder) {
       fatalError("UserTableViewCell init(coder:) has not been implemented")
    }

    func setupViews() {
        let containerStackView = UIStackView()
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.spacing = 8
        containerStackView.alignment = .fill
        containerStackView.distribution = .fillProportionally
        containerStackView.axis = .horizontal
        
        let contentStackView = UIStackView()
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.alignment = .fill
        contentStackView.distribution = .fillProportionally
        contentStackView.axis = .vertical
        contentStackView.spacing = 0
        contentStackView.addArrangedSubview(usernameLabel)
        contentStackView.addArrangedSubview(postsCountLabel)

        let avatarContainerView = UIView()
        avatarContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(containerStackView)
        containerStackView.addArrangedSubview(avatarContainerView)
        containerStackView.addArrangedSubview(contentStackView)

        avatarContainerView.addSubview(avatarImageView)

        let avatarViewWidth: CGFloat = 60
        
        NSLayoutConstraint.activate([
            avatarContainerView.widthAnchor.constraint(equalToConstant: avatarViewWidth)
        ])
        
        let containerHorizontalInset: CGFloat = 16
        let containerVerticalInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            containerStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -containerHorizontalInset),
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: containerHorizontalInset),
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: containerVerticalInset),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -containerVerticalInset)
        ])
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: avatarContainerView.centerYAnchor),
            avatarImageView.topAnchor.constraint(equalTo: avatarContainerView.topAnchor, constant: 0),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarViewWidth),
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarViewWidth)
        ])
    }
   
}

extension UserTableViewCell {
    
    func configure(with model: User) {
        usernameLabel.text = model.name
        postsCountLabel.text = "\(model.posts?.count ?? 0) \(NSLocalizedString("posts_count_title", comment: ""))"
        
        if let url = model.thumbnailUrl {
            avatarImageView.sd_setImage(with: URL(string: url), placeholderImage: #imageLiteral(resourceName: "avatar_placeholder"))
        }
    }
}

extension UserTableViewCell: Reusable {}
