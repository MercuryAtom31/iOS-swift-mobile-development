//
//  EventsViewModel.swift
//  CommunityLibraryEvents
//
//  Created by Hichem on 2024-09-11.
//

import SwiftUI
class EventsViewModel: ObservableObject {
    @Published var events: [Event] = []
    func loadEvents() {
        guard let url = Bundle.main.url(forResource: "events", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Failed to load events from bundle.")
            return
        }
        let decoder = JSONDecoder()
        if let decodedEvents = try? decoder.decode([Event].self, from: data) {
            self.events = decodedEvents
        }
    }
}
