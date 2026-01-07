//
//  MapView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-07.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let location: String
    
    @State private var position : MapCameraPosition = .automatic
    @State private var markerLocation = CLLocation()
    
    var body: some View {
        Map(position: $position, interactionModes: []) {
            
            Marker("Here", coordinate: markerLocation.coordinate)
                .tint(.purple)
        }
            .task {
                convertAddress(location: location)
            }
    }
    
    private func convertAddress(location: String) {
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(location, completionHandler : { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let placemarks = placemarks,
            let location = placemarks[0].location else {
                return
            }
            
            self.markerLocation = location
            
            let region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015)
            )
                
            self.position = .region(region)
        })
        
    }
}

#Preview {
    MapView(location: "台中市太平區太興路18號")
}
