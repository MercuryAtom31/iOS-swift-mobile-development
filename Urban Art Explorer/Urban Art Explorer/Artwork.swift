//
//  Artwork.swift
//  Urban Art Explorer
//
//  Created by Hichem on 2024-09-10.
//

import Foundation
import CoreLocation

struct Artwork: Identifiable {
    let id = UUID() // Unique identifier for each artwork
    let name: String
    let artist: String
    let latitude: Double //Coordinates representing the location of the artwork
    let longitude: Double
    var isVisited: Bool //A boolean flag to indicate if the user has visited this artwork
    
    /*
     This property converts the latitude and longitude into a CLLocationCoordinate2D object
     */
    var location: CLLocationCoordinate2D {
        /*
         CLLocationCoordinate2D:
         Represents a geographic coordinate on Earth. It is commonly used to represent
         a location in terms of latitude and longitude.
         */
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    // Computed property to retrieve the image based on the artwork's name
    var imageName: String {
        return name.replacingOccurrences(of: " ", with: "_").lowercased()
    }
    
    init(name: String, artist: String, latitude: Double, longitude: Double, isVisited: Bool = false) {
        self.name = name
        self.artist = artist
        self.latitude = latitude
        self.longitude = longitude
        self.isVisited = isVisited
    }
}
