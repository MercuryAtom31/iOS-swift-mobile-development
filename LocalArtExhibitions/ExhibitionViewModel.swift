//
//  ExhibitionViewModel.swift
//  LocalArtExhibitions
//
//  Created by Hichem on 2024-09-19.
//

import Foundation

class ExhibitionViewModel: ObservableObject {
    @Published var exhibitions: [Exhibition] = []

    init() {
        loadExhibitions()
    }

    private func loadExhibitions() {
        if let url = Bundle.main.url(forResource: "exhibitions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([Exhibition].self, from: data)
                self.exhibitions = decodedData
                print("Data loaded successfully!")  // For debugging
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("Could not find exhibitions.json")
        }
    }
}
