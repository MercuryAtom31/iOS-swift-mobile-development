//
//  ExhibitionDetailView.swift
//  LocalArtExhibitions
//
//  Created by Hichem on 2024-09-19.
//

import SwiftUI

struct ExhibitionDetailView: View {
    let exhibition: Exhibition

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if let uiImage = UIImage(named: exhibition.imageName) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 300)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                } else {
                    Text("Image not found: \(exhibition.imageName)")
                        .foregroundColor(.red)
                        .padding(.bottom, 10)
                }

                Text(exhibition.name)
                    .font(.title)
                    .padding(.bottom, 5)
                Text("Artist: \(exhibition.artist)")
                Text("Venue: \(exhibition.venue)")
                Text("Date: \(exhibition.date)")
            }
            .padding()
        }
    }
}
