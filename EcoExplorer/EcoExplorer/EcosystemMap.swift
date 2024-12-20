import SwiftUI
import MapKit

struct EcosystemMap: View {
    @ObservedObject var ecosystems = Ecosystems() // Ecosystem data
    @State private var mapType: MKMapType = .standard // Map type state
    @State private var region = MKCoordinateRegion( // Default region, adjust as necessary
        center: CLLocationCoordinate2D(latitude: 0, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )

    var body: some View {
        VStack {
            // Use the EcosystemMapView
            EcosystemMapView(
                mapType: $mapType,
                region: region,
                annotationItems: ecosystems.ecosystems
            )
            .frame(height: 400)
            .cornerRadius(10)
            
            // Toggle to switch map type
            Picker("Map Style", selection: $mapType) {
                Text("Standard").tag(MKMapType.standard)
                Text("Satellite").tag(MKMapType.satellite)
                Text("Hybrid").tag(MKMapType.hybrid)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}


