//
//  Landmark.swift
//  landmarkSwiftUi
//
//  Created by Muhammed Siddiqui on 2025-03-18.
//
//MARK: IMPORT FRAMEWORKS
import Foundation
import SwiftUI
import CoreLocation
                                                  //Imagine you're putting landmarks in a box labeled with a number. Hashable gives each landmark a unique number so you can find it fast later.
struct Landmark: Hashable, Codable, Identifiable {//  Like writing a landmark's info in a notebook (encode) and later reading it back (decode) to rebuild the same, save and load
    //landmark.
                                                  // Like giving each landmark a name tag or ID card so I can tell them apart.
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool

   

private var imageName: String // private means hidden variable which you cant access without outside the class of struct.which hold text value couse of data type is String
    var image: Image {//image is a computed property
        Image(imageName)//It doesn’t store an Image directly
        //It creates a new Image every time  ask for it, based on the imageName
    }

    private var coordinates: Coordinates // It's marked private so other parts of your code can't directly access it — it's hidden
    var locationCoordianates: CLLocationCoordinate2D {// it is again computed method
        CLLocationCoordinate2D (// it doesnot store  coordinates, but in here it uses the stored coordinates  in struct
            latitude: coordinates.latitude,// here i am accessing the stored latitude values
            longitude: coordinates.longitude)// here i am accessing the stored longitude
    }
    
    struct Coordinates: Hashable, Codable {// Because in Json data it is nested and it means i need to make struct for them
        var latitude: Double
        var longitude: Double
    }
    
    var category: Category// have a variable called category, and it can only be one of the values from the Category enum below. Think of it like a menu where you can pick one item — for example: pizza, burger, or pasta. In Swift, you'd use an enum to represent those choices.
    enum Category: String, CaseIterable, Codable {// caseIterable is useful when you want to loop through all the possible choices in your enum — like making a list, a menu, or a dropdown.
        case lakes = "Lakes"// This means your Category can be one of these three specific choices:
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}


