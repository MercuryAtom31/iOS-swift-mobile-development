//
//  TweetsViewModel.swift
//  CelebrityTweets
//
//  Created by Hichem on 2024-11-01.
//

//import Foundation
///*
// TweetsViewModel conforms to ObservableObject to manage the app's state and data.
// */
//class TweetsViewModel: ObservableObject {
//    /*
//     @Published properties notify the views when data or state changes.
//     */
//    @Published var tweets: [Tweet] = []
//    @Published var state: FetchState = .notStarted
//
//    enum FetchState {
//        case notStarted, fetching, success, failed
//    }
//    /*
//     The loadTweets method fetches tweets asynchronously and updates the state to manage the UI accordingly.
//     */
//    func loadTweets() async {
//        self.state = .fetching
//        do {
//            let fetchedTweets = try await NetworkService.shared.fetchTweets()
//            DispatchQueue.main.async {
//                self.tweets = fetchedTweets
//                self.state = .success
//            }
//        } catch {
//            DispatchQueue.main.async {
//                self.state = .failed
//            }
//        }
//    }
//}
import Foundation

class TweetsViewModel: ObservableObject {
    @Published var tweets: [Tweet] = []
    @Published var state: FetchState = .notStarted

    enum FetchState {
        case notStarted, fetching, success, failed
    }

    func loadTweets() async {
        self.state = .fetching
        do {
            let fetchedTweets = try await NetworkService.shared.fetchTweets()
            DispatchQueue.main.async {
                print("Fetched \(fetchedTweets.count) tweets")  // Debugging output
                self.tweets = fetchedTweets
                self.state = .success
            }
        } catch {
            DispatchQueue.main.async {
                print("Failed to load tweets: \(error)")  // Debugging output
                self.state = .failed
            }
        }
    }
}
