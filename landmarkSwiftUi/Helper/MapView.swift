//
//  MapView.swift
//  landmarkSwiftUi
//
//  Created by Muhammed Siddiqui on 2025-03-06.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D//CLLocationCoordinate2D is a type that represents a location using latitude and longitude in a two-dimensional coordinate system.
    
    var body: some View {
        //Map(initialPosition: .region(region))// A view in SwiftUI that displays a map on the screen.
        Map(position: .constant(.region(region)))//The .constant part means that the position is fixed (it won’t change dynamically). You are giving the map a constant region to display.Map needs position, position needs region and region means coordinates thats how region will display on map.
    }
    
    private var region: MKCoordinateRegion {// native framework stored in variable.computed method
        MKCoordinateRegion(
            center: coordinate,// region from surface
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)// camera position
        
        )
    }
    
    
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
