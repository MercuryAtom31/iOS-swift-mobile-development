import SwiftUI
import MapKit

struct EcosystemDetail: View {
    var ecosystem: Ecosystem
    @State private var region: MKCoordinateRegion
    @State private var mapType: MKMapType = .hybrid

    init(ecosystem: Ecosystem) {
        self.ecosystem = ecosystem
        _region = State(initialValue: MKCoordinateRegion(
            center: ecosystem.locationCoordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        ))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(ecosystem.imageName)
                    .resizable()
                    .scaledToFit()
//                    .frame(height: 200)

                Text(ecosystem.name)
                    .font(.title)
                    .padding(.top)

                Text("Country: \(ecosystem.country)") // Display the country
                    .padding(.top, 4)

                Text("Type: \(ecosystem.type)")
                    .padding(.top, 4)

                Text("Notable Species: \(ecosystem.notableSpecies)")
                    .padding(.top, 4)

                Text("Conservation Status: \(ecosystem.conservationStatus)")
                    .padding(.top, 4)

                EcosystemMapView(mapType: $mapType, region: region, annotationItems: [ecosystem])
                    .frame(height: 300)
                    .cornerRadius(10)
                    .padding(.top)

                Picker("Map Style", selection: $mapType) {
                    Text("Standard").tag(MKMapType.standard)
                    Text("Satellite").tag(MKMapType.satellite)
                    Text("Hybrid").tag(MKMapType.hybrid)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
            .padding()
        }
        .navigationBarTitle(ecosystem.name, displayMode: .inline)
    }
}
