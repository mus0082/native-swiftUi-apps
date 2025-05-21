//
//  ModelData.swift
//  landmarkSwiftUi
//
//  Created by Muhammed Siddiqui on 2025-03-18.
//

import Foundation

@Observable// if something inside this class changes, update the UI that uses it. So if  landmarks data changes, the views will automatically refresh.
class ModelData{// use this class to store and manage your app’s data. it is like the blue print
    var landmarks: [Landmark] = load("landmarkData.json")// This line creates a variable named landmarks, and it stores a list of Landmark items (like an array of places or objects in your app). And it uses the landmarkData.json file.
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }// Current object $0 will be saved and check it will save var name features
            
    }
    
    var categories: [String: [Landmark]] {// have a list of places (like a list of landmarks).
        Dictionary(//This is a tool Swift gives you to group items into a box.
            grouping: landmarks,//Group all the landmarks by something (like their category).
            by: {$0.category.rawValue}//current value represents $0 and check category it will save . Look at the category of each landmark, and use the name like ‘Lakes’, ‘Rivers’, or ‘Mountains’.It gets the category name from each landmark and sorts them
            )
    }
}

//var landmarks: [Landmark] = load("landmarkData.json")// Global Declare so we can access this array anywhere, it contains json data.

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
