//
//  MainView.swift
//  Urban Art Explorer
//
//  Created by Hichem on 2024-09-10.
//

import SwiftUI

struct MainView: View {
    // Sample artwork data
    let artworks = [
        Artwork(name: "Sunset Mural", artist: "John Doe", latitude: 34.0522, longitude: -118.2437),
        Artwork(name: "Abstract Art", artist: "Jane Smith", latitude: 34.0523, longitude: -118.2440),
        Artwork(name: "Starry Night", artist: "Vincent Van Gogh", latitude: 40.7614, longitude: -73.9776),
        Artwork(name: "Girl with a Pearl Earring", artist: "Jan Vermeer van Delft", latitude: 52.0805, longitude: 4.3147),
        Artwork(name: "Mona Lisa (La Gioconda)", artist: "Leonardo da Vinci", latitude: 48.8606, longitude: 2.3376),
        Artwork(name: "Vase With Twelve Sunflowers II", artist: "Vincent Van Gogh", latitude: 48.1492, longitude: 11.5676),
        Artwork(name: "Impression Sunrise", artist: "Claude Monet", latitude: 48.8584, longitude: 2.2667)
    ]
    
    var body: some View {
        NavigationView {
            List(artworks) { artwork in
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
            .navigationTitle("Urban Art Explorer")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

