//
//  ExhibitionListView.swift
//  LocalArtExhibitions
//
//  Created by Hichem on 2024-09-19.
//

import SwiftUI

struct ExhibitionListView: View {
    @ObservedObject var viewModel = ExhibitionViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.exhibitions) { exhibition in
                NavigationLink(destination: ExhibitionDetailView(exhibition: exhibition)) {
                    Text(exhibition.name)
                }
            }
            .navigationTitle("Art Exhibitions")
        }
    }
}
