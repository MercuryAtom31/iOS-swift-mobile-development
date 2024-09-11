//
//  ArtworkListView.swift
//  Urban Art Explorer
//
//  Created by Hichem on 2024-09-10.
//
import SwiftUI

struct ArtworkListView: View {
    @State private var searchText = ""
    @State private var showVisitedOnly = false
    
    // Sample artwork data
    let artworks = [
        Artwork(name: "Sunset Mural", artist: "John Doe", latitude: 34.0522, longitude: -118.2437),
        Artwork(name: "Abstract Art", artist: "Jane Smith", latitude: 34.0523, longitude: -118.2440)
    ]
    
    // Computed property to filter artworks
    var filteredArtworks: [Artwork] {
        artworks.filter { artwork in
            (artwork.name.contains(searchText) || artwork.artist.contains(searchText)) &&
            (!showVisitedOnly || artwork.isVisited)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Search bar
                TextField("Search by name or artist", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Toggle for filtering visited artworks
                Toggle(isOn: $showVisitedOnly) {
                    Text("Show visited only")
                }
                .padding()
                
                // Artwork list
                List(filteredArtworks) { artwork in
                    NavigationLink(destination: ArtworkDetailView(artwork: artwork)) {
                        HStack {
                            Image(artwork.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                            VStack(alignment: .leading) {
                                Text(artwork.name)
                                    .font(.headline)
                                Text(artwork.artist)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Artworks")
        }
    }
}
