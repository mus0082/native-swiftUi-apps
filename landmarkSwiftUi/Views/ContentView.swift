//
//  ContentView.swift
//  landmarkSwiftUi
//
//  Created by Muhammed Siddiqui on 2025-03-06.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured// whereever needs selection needs use state.
    
    enum Tab {
        case featured
        case list
    }
    
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)// if i dont put period .tag just tag then it will show UI layout spacing issue.
            }
        }

    }

#Preview {
    ContentView()
        .environment(ModelData())
}
