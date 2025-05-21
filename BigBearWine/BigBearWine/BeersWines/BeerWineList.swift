//
//  BeerWineList.swift
//  BigBearWine
//
//  Created by Muhammad Siddiqui on 2025-05-09.
//

import SwiftUI

struct BeerWineList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredBeersWines : [BeerWines] {
        modelData.storedBeerWineData.filter { currentBeerWine in
            (!showFavoritesOnly || currentBeerWine.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(filteredBeersWines) { currentBeerWine in
                    NavigationLink {
                        BeerWineDetail(blueprintBeerWines: currentBeerWine)
                    }label: {
                        BeerRow(beerWineStored: currentBeerWine)
                    }
                }
            }
            .animation(.default, value: filteredBeersWines)
            .navigationTitle("Beers&Wines")
        } detail: {
            Text("Select a View")
        }
    }
}

#Preview {
    BeerWineList()
        .environment(ModelData())
}
