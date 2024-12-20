import Foundation
import CoreLocation

/*
 Identifiable: Helps SwiftUI uniquely identify items in a list or collection.
 Decodable: Helps convert data from formats such as JSON into usable objects.
 */
struct Ecosystem: Identifiable, Decodable {
    var id = UUID() 
    var name: String
    var type: String
    var latitude: Double
    var longitude: Double
    var notableSpecies: String
    var conservationStatus: String
    var country: String

    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    var imageName: String {
        return name.replacingOccurrences(of: " ", with: "_").lowercased()
    }

    // CodingKeys to exclude 'id' from JSON decoding
    private enum CodingKeys: String, CodingKey {
        case name, type, latitude, longitude, notableSpecies, conservationStatus, country
    }
}
