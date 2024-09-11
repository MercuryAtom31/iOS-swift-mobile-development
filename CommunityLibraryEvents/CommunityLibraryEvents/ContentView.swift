//
//  ContentView.swift
//  CommunityLibraryEvents
//
//  Created by Hichem on 2024-09-11.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = EventsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.events) { event in
                NavigationLink(destination: EventDetailView(event: event)) {
                    Text(event.title)
                }
            }
            .navigationTitle("Library Events")
            .onAppear {
                
                viewModel.loadEvents()
            }
        }
    }
}
struct EventDetailView: View {
    
    var event: Event
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(event.title).font(.title)
                Text(event.date).font(.headline)
                Text(event.description).font(.body)
            }
            .padding()
        }
        .navigationTitle("Event Details")
    }
}
