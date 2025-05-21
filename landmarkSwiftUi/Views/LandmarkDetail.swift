//
//  LandmarkDetail.swift
//  landmarkSwiftUi
//
//  Created by Muhammed Siddiqui on 2025-03-18.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData//I have one shared box of data (like ModelData) that many screens (views) in my app can read from. And if something changes in that box, all screens using it will automatically update too.  one view updates it, all the other views react and update too.
    
    var landmark: Landmark// The variable is of type Landmark, which is our model.
    
    var landmarkIndex: Int{
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id})!// The whole list of landmarks. Find the index (position) of the item that matches. match the ID of the item in the list with the ID of the current landmark.
    }
    
    var body: some View {
        @Bindable var modelData = modelData// This allows you to bind and change properties inside your shared data (ModelData) and let SwiftUI know to refresh the view when changes happen.
        
        ScrollView {
            MapView(coordinate: landmark.locationCoordianates)// This accesses the map associated with the Landmark model. without model landmark i cant able to build view
                .frame(height: 300)
            
            CircleImage(image: landmark.image)//This accesses the image associated with the Landmark model. without model landmark i cant able to build view
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack{
                    Text(landmark.name)//This accesses the name associated with the Landmark model. without model landmark i cant able to build view
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)//Is a custom button I made. isSet means it takes a true/false value. all landmarks have index
                }
                
                HStack {
                    Text(landmark.park)//This accesses the park associated with the Landmark model. without model landmark i cant able to build view
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)//This accesses the state associated with the Landmark model. without model landmark i cant able to build view
                        .font(.subheadline)
                    }
                
                Divider()
                
                Text(landmark.name)//This accesses the name associated with the Landmark model. without model landmark i cant able to build view
                    .font(.title2)
                Text(landmark.description)//This accesses the description associated with the Landmark model. without model landmark i cant able to build view
                
                }
                .padding()
            }
        .navigationTitle(landmark.name)//This accesses the name associated with the Landmark model. without model landmark i cant able to build view
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    let modelData = ModelData()// Instance created for
    return LandmarkDetail(landmark: ModelData().landmarks[0])// i dont understand
        .environment(modelData)
}
