//
//  Exhibition.swift
//  LocalArtExhibitions
//
//  Created by Hichem on 2024-09-19.
//

import Foundation

struct Exhibition: Codable, Identifiable {
    let id: UUID
    let name: String
    let date: String
    let artist: String
    let venue: String
    let imageName: String
}
