//
//  MapView.swift
//  FoodPin
//
//  Created by Cash on 2026-01-07.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let location : String = ""
    
    @State private var region : MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51.510357, longitude: -0.116773),
        span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
    )
    
    var body: some View {
        Map(initialPosition: .region(region))
    }
}

#Preview {
    MapView()
}
