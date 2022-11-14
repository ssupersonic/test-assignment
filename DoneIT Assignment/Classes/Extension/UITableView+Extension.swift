//
//  UITableView+Extension.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 12.11.2022.
//

import UIKit

protocol Reusable {
    static var identifier: String { get }
    static func dequeue(in tableView: UITableView, at indexPath: IndexPath) -> Self
}

extension Reusable where Self: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func dequeue(in tableView: UITableView, at indexPath: IndexPath) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Self else {
            fatalError("Wrong cell id")
        }
        return cell
    }
}
