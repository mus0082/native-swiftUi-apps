//
//  LandmarkList.swift
//  landmarkSwiftUi
//
//  Created by Muhammed Siddiqui on 2025-03-18.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData// I have one shared box of data (like ModelData) that many screens (views) in my app can read from. And if something changes in that box, all screens using it will automatically update too.  one view updates it, all the other views react and update too.
    @State private var showFavouritesOnly = false// defualt list show all. state use when you need to show switch use state
    
    var filteredLandmarks: [Landmark]{
        modelData.landmarks.filter { landmark in//  is your full list of landmarks.And go through each landmark and keep only the ones that match this rule.
            (!showFavouritesOnly || landmark.isFavorite)//If showFavouritesOnly is false, then !showFavouritesOnly is true, so it keeps all landmarks.
            //if showFavouritesOnly is true, it checks landmark.isFavorite, and keeps only favorites.
        }
    }
    
    var body: some View {
        NavigationSplitView{
            //List(landmarks, id: \.id) it removes id because we added identifiable in model class Landmark.
            List {
                Toggle(isOn: $showFavouritesOnly){
                    Text("Favourites Only")
                }
                ForEach(filteredLandmarks) {landmark in // show all records first and if toggle
                    //List(landmarks){ landmark in// this is the landmark array which I created in model data.Inside the closure, we refer to each landmark one by one (like landmark is a placeholder for each item in the landmarks array).
                    NavigationLink{//Inside the closure, I am using NavigationLink. It’s like a button that, when clicked, takes you to a new screen (like tapping on an item in a list).
                        LandmarkDetail(landmark: landmark)// In the detail page i have landmark variable which data type is Landmark model. it takes me to same page or display same data in detail screen where the user choose the landmark row
                    }label: {
                        LandmarkRow(landmark: landmark)//exactly same here
                    }
                }
//                LandmarkRow(landmark: landmark)
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        }detail: {// when the user use on ipad it will the first thing it will show on screen select a landmark othewise if i remove this it wont say any display message.
            Text("Select a Landmark")
        }

    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())//To Preview, Otherwise i could not able to see the view.
}
