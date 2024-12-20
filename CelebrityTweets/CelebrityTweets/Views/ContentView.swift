//
//  ContentView.swift
//  CelebrityTweets
//
//  Created by Hichem on 2024-11-01.
//
//
//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var viewModel = TweetsViewModel()
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Your existing switch case for handling states
//                switch viewModel.state {
//                case .fetching:
//                    // Existing code for fetching state
//                    VStack(spacing: 16) {
//                        ProgressView("Fetching tweets...")
//                            .progressViewStyle(CircularProgressViewStyle())
//                            .padding()
//                        Text("Please wait while we load the latest tweets.")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(Color(UIColor.systemBackground))
//                case .success:
//                    List(viewModel.tweets) { tweet in
//                        TweetView(tweet: tweet)
//                    }
//                    .listStyle(PlainListStyle())
//                    .background(Color(UIColor.systemGray6).opacity(0.1))
//                case .failed:
//                    // Existing code for error state
//                    VStack(spacing: 16) {
//                        Image(systemName: "exclamationmark.triangle.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 50, height: 50)
//                            .foregroundColor(.red)
//                            .padding(.bottom, 8)
//                        Text("Failed to load tweets. Please try again.")
//                            .font(.headline)
//                            .foregroundColor(.red)
//                            .multilineTextAlignment(.center)
//                            .padding(.horizontal)
//                        Button(action: {
//                            Task {
//                                await viewModel.loadTweets()
//                            }
//                        }) {
//                            Text("Retry")
//                                .font(.body)
//                                .fontWeight(.semibold)
//                                .padding()
//                                .background(Color.blue)
//                                .foregroundColor(.white)
//                                .cornerRadius(8)
//                        }
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(Color(UIColor.systemBackground))
//                case .notStarted:
//                    Text("No tweets to display.")
//                        .font(.headline)
//                        .foregroundColor(.gray)
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .background(Color(UIColor.systemBackground))
//                }
//            }
//            .navigationTitle("Celebrity Tweets")
//            .navigationBarItems(trailing: Button(action: {
//                Task {
//                    await viewModel.loadTweets()
//                }
//            }) {
//                Image(systemName: "arrow.clockwise")
//                    .font(.title2)
//                    .foregroundColor(.blue)
//            })
//            .onAppear {
//                Task {
//                    await viewModel.loadTweets()
//                }
//            }
////            .background(LinearGradient(
////                gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.white]),
////                startPoint: .top,
////                endPoint: .bottom
////            ))
//            .background(ThemeManager.Colors.blue1)
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
//    }
//}
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TweetsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // Custom title bar
                HStack {
                    Text("Celebrity Tweets")
                        .font(ThemeManager.Fonts.headline)  // Applying the custom headline font
                        .foregroundColor(.black)  // Adjust the color if needed
                    Spacer()
                }
                .padding()
                .background(ThemeManager.Colors.blue1)  // Background color for the title bar
                
                // Your existing switch case for handling states
                switch viewModel.state {
                case .fetching:
                    VStack(spacing: 16) {
                        ProgressView("Fetching tweets...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                        Text("Please wait while we load the latest tweets.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(UIColor.systemBackground))
                case .success:
                    List(viewModel.tweets) { tweet in
                        TweetView(tweet: tweet)
                    }
                    .listStyle(PlainListStyle())
                    .background(Color(UIColor.systemGray6).opacity(0.1))
                case .failed:
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.red)
                            .padding(.bottom, 8)
                        Text("Failed to load tweets. Please try again.")
                            .font(.headline)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Button(action: {
                            Task {
                                await viewModel.loadTweets()
                            }
                        }) {
                            Text("Retry")
                                .font(.body)
                                .fontWeight(.semibold)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(UIColor.systemBackground))
                case .notStarted:
                    Text("No tweets to display.")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(UIColor.systemBackground))
                }
            }
            .navigationBarHidden(true)  // Hide the default navigation bar
            .navigationBarItems(trailing: Button(action: {
                Task {
                    await viewModel.loadTweets()
                }
            }) {
                Image(systemName: "arrow.clockwise")
                    .font(.title2)
                    .foregroundColor(.blue)
            })
            .onAppear {
                Task {
                    await viewModel.loadTweets()
                }
            }
            .background(ThemeManager.Colors.blue1)  // Applying custom background color
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

