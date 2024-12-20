//
//  TweetDetailView.swift
//  CelebrityTweets
//
//  Created by Hichem on 2024-11-01.
//

import SwiftUI

struct TweetDetailView: View {
    let tweet: Tweet

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("User ID: \(tweet.userId)")
                .font(.headline)
                .foregroundColor(.blue)
            Text(tweet.title.capitalized)
                .font(.title)
                .fontWeight(.bold)
            Text(tweet.body)
                .font(.body)
                .foregroundColor(.primary)
            Spacer()
        }
        .padding()
        .navigationTitle("Tweet Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
