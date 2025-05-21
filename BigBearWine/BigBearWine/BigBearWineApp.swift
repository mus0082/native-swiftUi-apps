//
//  BigBearWineApp.swift
//  BigBearWine
//
//  Created by Muhammed Siddiqui on 2025-05-07.
//

import SwiftUI

@main
struct BigBearWineApp: App {
    @State private var modelData =  ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
