//
//  User.swift
//  CelebrityTweets
//
//  Created by Hichem on 2024-11-01.
//

import Foundation

struct User: Decodable, Identifiable {
    let id: Int
    let name: String
    let bio: String
    let profileImageURL: String
}
