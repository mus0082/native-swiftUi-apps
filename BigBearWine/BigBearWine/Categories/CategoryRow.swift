//
//  CategoryRow.swift
//  BigBearWine
//
//  Created by Muhammad Siddiqui on 2025-05-18.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [BeerWines]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 20)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(items) { currentBeer in
                        NavigationLink {
                            BeerWineDetail(blueprintBeerWines: currentBeer)
                        } label: {
                            CategoryItem(storedBeerWineData: currentBeer)
                        }
                    }
                }
            }
            .frame(height: 350)
        }
    
    }
}

#Preview {
    let beerWinesStoredModelData = ModelData().storedBeerWineData
    return CategoryRow (
        categoryName: beerWinesStoredModelData[0].category.rawValue,
        items: Array(beerWinesStoredModelData.prefix(3))
        )
}
