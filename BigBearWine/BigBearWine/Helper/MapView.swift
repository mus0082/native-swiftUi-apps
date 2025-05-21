//
//  MapView.swift
//  BigBearWine
//
//  Created by Muhammed Siddiqui on 2025-05-07.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinates: CLLocationCoordinate2D
    var body: some View {
        Map(position: .constant(.region(region)))
    }
    private var region: MKCoordinateRegion {
        MKCoordinateRegion (
            center: coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        
    }
    
}

#Preview {
    MapView(coordinates: CLLocationCoordinate2D(latitude: 60.727, longitude: -135.06))
}
