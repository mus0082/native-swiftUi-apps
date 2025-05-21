//
//  BearWines.swift
//  BigBearWine
//
//  Created by Muhammed Siddiqui on 2025-05-08.
//

import Foundation
import SwiftUI
import CoreLocation

struct BeerWines: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var brewery: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isAvailable: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case wine = "Wine"
        case beer = "Beer"
        case bourbon = "Bourbon"
        
    }
    
}
