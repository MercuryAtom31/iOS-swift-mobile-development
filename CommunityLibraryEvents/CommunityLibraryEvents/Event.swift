//
//  Event.swift
//  CommunityLibraryEvents
//
//  Created by Hichem on 2024-09-11.
//

import Foundation

struct Event: Identifiable, Decodable {
    var id: Int
    var title: String
    var date: String
    var description: String
}
