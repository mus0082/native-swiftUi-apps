//
//  BeerRow.swift
//  BigBearWine
//
//  Created by Muhammad Siddiqui on 2025-05-08.
//

import SwiftUI

struct BeerRow: View {
    var beerWineStored: BeerWines
    
    var body: some View {
        HStack {
            beerWineStored.image
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 100)
            Text(beerWineStored.name)
            Spacer()
            
            if beerWineStored.isFavorite {
                 Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                   
            }
        }
    }
}

#Preview {
    let storedData = ModelData().storedBeerWineData
    return Group {
        BeerRow(beerWineStored: storedData[0])
        BeerRow(beerWineStored: storedData[1])
    }
}



