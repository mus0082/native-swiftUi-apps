//
//  CategoryRow.swift
//  landmarkSwiftUi
//
//  Created by Muhammed Siddiqui on 2025-04-30.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
        
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 5){
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        }label: {//This is the view that will appear in the list or on the screen, which the user interacts with.button-like" view
                            CategoryItem(landmark: landmark)
                        }
                        
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(3))
        )
}
