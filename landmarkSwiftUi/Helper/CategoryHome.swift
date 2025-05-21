//
//  CategoryHome.swift
//  landmarkSwiftUi
//
//  Created by Muhammed Siddiqui on 2025-04-30.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView{
            List{
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in//  id: \.self means each item is unique by itself (a String, like "Lakes")
                    //This is a loop. SwiftUI uses this to repeat a view for each item in the list.It loops over each category name
                    CategoryRow(categoryName: key, items:modelData.categories[key]!)// i dont know what it is doing?
                }
                .listRowInsets(EdgeInsets())
            }
                
            .navigationTitle("Featured")
        }
        detail:{
            Text("Select Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
