//
//  PostTableViewCell.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
       fatalError("PostTableViewCell init(coder:) has not been implemented")
    }

    func setupViews() {
        let contentStackView = UIStackView()
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.alignment = .fill
        contentStackView.distribution = .fillProportionally
        contentStackView.axis = .vertical
        contentStackView.spacing = 0
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(descriptionLabel)

        contentView.addSubview(contentStackView)

        let horizontalInset: CGFloat = 16
        let verticalInset: CGFloat = 10
        
        NSLayoutConstraint.activate([
            contentStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -horizontalInset),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: horizontalInset),
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalInset),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalInset)
        ])
    }  
}

extension PostTableViewCell {
    
    func configure(with model: Post) {
        titleLabel.text = model.title
        descriptionLabel.text = model.body
    }
}

extension PostTableViewCell: Reusable {}
