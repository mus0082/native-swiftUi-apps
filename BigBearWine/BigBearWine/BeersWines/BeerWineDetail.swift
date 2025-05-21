//
//  BeerWineDetail.swift
//  BigBearWine
//
//  Created by Muhammad Siddiqui on 2025-05-09.
//

import SwiftUI

struct BeerWineDetail: View {
    @Environment(ModelData.self) var modelData
    var blueprintBeerWines: BeerWines
    
    var BeerWineIndex: Int {
        modelData.storedBeerWineData.firstIndex(where: {
            $0.id == blueprintBeerWines.id
        }) ?? 0
    }
    
    var body: some View {
        @Bindable var modelData = modelData//// This allows you to bind and change properties inside your shared data (ModelData) and let SwiftUI know to refresh the view when changes happen.
        
        ScrollView {
            MapView(coordinates: blueprintBeerWines.locationCoordinates)
                .frame(height: 300)
            
            CircleImage(image: blueprintBeerWines.image)
                .offset(y: -110)
                .padding(.bottom, -130)
            
            VStack (alignment: .leading) {
                HStack{
                    Text(blueprintBeerWines.name)
                        .font(.title)
                    FavouriteButton(isSet: $modelData.storedBeerWineData[BeerWineIndex].isFavorite)//Is a custom button I made. isSet means it takes a true/false value. all landmarks have index.This button should show the isFavorite status of this specific item from the data array. And if the user taps the button to change it, update the original data too
                }
                HStack{
                    Text(blueprintBeerWines.brewery)
                        .font(.subheadline)
                    Spacer()
                    Text(blueprintBeerWines.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(blueprintBeerWines.name)")
                    .font(.title2)
                Text(blueprintBeerWines.description)
                
            }
            .padding()
        }
        .navigationTitle(blueprintBeerWines.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return BeerWineDetail(blueprintBeerWines: ModelData().storedBeerWineData[0])
        .environment(modelData)
}
