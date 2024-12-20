//
//  NetworkService.swift
//  CelebrityTweets
//
//  Created by Hichem on 2024-11-01.
//

import Foundation
/*
 NetworkService is a singleton class that manages API requests.
 */
class NetworkService {
    static let shared = NetworkService()

    private init() {}
    /*
     fetchTweets and fetchUserDetails use URLSession with async/await for asynchronous data fetching.
     */
    func fetchTweets() async throws -> [Tweet] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        /*
         JSONDecoder is used to decode the JSON response into Tweet and User models.
         */
        let tweets = try JSONDecoder().decode([Tweet].self, from: data)
        return tweets
    }

    func fetchUserDetails(userId: Int) async throws -> User {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(userId)") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        /*
         JSONDecoder is used to decode the JSON response into Tweet and User models.
         */
        let user = try JSONDecoder().decode(User.self, from: data)
        return user
    }
}
