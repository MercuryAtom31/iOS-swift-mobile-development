import SwiftUI
import MapKit

struct EcosystemMapView: UIViewRepresentable {
    @Binding var mapType: MKMapType
    var region: MKCoordinateRegion
    var annotationItems: [Ecosystem]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.mapType = mapType
        mapView.setRegion(region, animated: true)
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = mapType
        mapView.setRegion(region, animated: true)

        // Remove existing annotations
        mapView.removeAnnotations(mapView.annotations)

        // Add new annotations
        for item in annotationItems {
            let annotation = MKPointAnnotation()
            annotation.coordinate = item.locationCoordinates
            annotation.title = item.name
            mapView.addAnnotation(annotation)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: EcosystemMapView

        init(_ parent: EcosystemMapView) {
            self.parent = parent
        }
    }
}

