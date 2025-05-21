//
//  landmarkSwiftUiApp.swift
//  landmarkSwiftUi
//
//  Created by Muhammed Siddiqui on 2025-03-06.
//

import SwiftUI

@main
struct landmarkSwiftUiApp: App {
    @State private var modelData = ModelData()// That's the class inside that we have landmark.json
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)// we declare environment which contains list environment model data.
        }
    }
}
