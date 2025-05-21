//
//  ModelData.swift
//  BigBearWine
//
//  Created by Muhammed Siddiqui on 2025-05-08.
//

import Foundation

@Observable
class ModelData {
    var storedBeerWineData: [BeerWines] = load("BeerWineData.json")

    var features: [BeerWines] {
        storedBeerWineData.filter { $0.isAvailable}
    }
    
    var categories: [String: [BeerWines]] {
        Dictionary(
            grouping: storedBeerWineData,
            by: { $0.category.rawValue }
        )
    }
}




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
