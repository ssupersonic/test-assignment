//
//  User.swift
//  DoneIT Assignment
//
//  Created by Olexii Strilets on 14.11.2022.
//

import Foundation

struct User: Codable, Hashable {
    
    let id: Int
    let albumId: Int?
    let name: String?
    let url: String?
    let thumbnailUrl: String?
    var posts: [Post]?
    
    private enum CodingKeys: String, CodingKey {
        case id = "userId"
        case albumId
        case name
        case url
        case thumbnailUrl
        case posts
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name &&
        lhs.id == rhs.id &&
        lhs.albumId == rhs.albumId &&
        lhs.url == rhs.url &&
        lhs.thumbnailUrl == rhs.thumbnailUrl &&
        lhs.posts == rhs.posts
    }
}

