//
//  Tweet.swift
//  CelebrityTweets
//
//  Created by Hichem on 2024-11-01.
//

import Foundation

struct Tweet: Decodable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
