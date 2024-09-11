//
//  ArtworkDetailView.swift
//  Urban Art Explorer
//
//  Created by Hichem on 2024-09-10.
//
import SwiftUI
import MapKit

struct ArtworkDetailView: View {
    let artwork: Artwork

    var body: some View {
        VStack {
            Image(artwork.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(artwork.name)
                .font(.largeTitle)
                .bold()
            
            Text("By \(artwork.artist)")
                .font(.title2)
                .padding(.top, 5)
            
            // Map to show artwork's location
            Map(coordinateRegion: .constant(MKCoordinateRegion(
                center: artwork.location,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )))
            .frame(height: 300)
            
            Spacer()
        }
        .padding()
        .navigationTitle(artwork.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ArtworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkDetailView(artwork: Artwork(name: "Sunset Mural", artist: "John Doe", latitude: 34.0522, longitude: -118.2437))
    }
}

