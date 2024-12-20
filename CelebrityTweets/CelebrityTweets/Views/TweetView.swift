//
//  TweetView.swift
//  CelebrityTweets
//
//  Created by Hichem on 2024-11-01.
//

import SwiftUI

struct TweetView: View {
    let tweet: Tweet

    var body: some View {
        NavigationLink(destination: TweetDetailView(tweet: tweet)) {
            VStack(alignment: .leading, spacing: 8) {
                Text("User ID: \(tweet.userId)")
                    .font(.headline)
//                    .foregroundColor(.blue)
                    .foregroundColor(ThemeManager.Colors.yellow1)
                Text(tweet.title.capitalized)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.bottom, 2)
                Text(tweet.body)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                Divider()
            }
            .padding()
//            .background(Color(UIColor.systemGray6))
            .background(ThemeManager.Colors.blue2)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
    }
}
