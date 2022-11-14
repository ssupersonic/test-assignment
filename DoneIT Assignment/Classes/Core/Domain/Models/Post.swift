//
//  Post.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import Foundation

struct Post: Codable, Hashable {
    let id: Int
    let userId: Int
    let title: String?
    let body: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case userId
        case title
        case body
    }
    
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.userId == rhs.userId &&
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.body == rhs.body
    }
}
