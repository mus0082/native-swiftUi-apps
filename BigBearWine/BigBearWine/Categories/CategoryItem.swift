//
//  CategoryItem.swift
//  BigBearWine
//
//  Created by Muhammad Siddiqui on 2025-05-19.
//

import SwiftUI

struct CategoryItem: View {
    var storedBeerWineData: BeerWines
    
    var body: some View {
        VStack(alignment: .leading) {
            storedBeerWineData.image
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .cornerRadius(5)
            Text(storedBeerWineData.name)
                .foregroundStyle(.black)
                .padding(.leading, 110)
                .font(.subheadline)
        }
        .padding(.leading, 0)
    }
}

#Preview {
    CategoryItem(storedBeerWineData: ModelData().storedBeerWineData[0])
}
