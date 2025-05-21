//
//  LandmarkRow.swift
//  landmarkSwiftUi
//
//  Created by Muhammed Siddiqui on 2025-03-18.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark// The variable is of type Landmark, which is our model

    
    var body: some View {
        
        HStack {
            landmark.image// This accesses the image associated with the Landmark model. without model landmark i cant able to build view
                .resizable()
                .frame(width:50, height:50)
            Text(landmark.name)// This accesses the name associated with the Landmark model
            
            Spacer()
            
            if landmark.isFavorite{// property or it can be product that i want to change
                Image(systemName: "star.fill")// Show the filled star if isFavorite is true. without if cant able to display anything.
                    .foregroundStyle(.yellow)// modifier
            }
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks// assign operator
    return Group{
        LandmarkRow(landmark:  landmarks[0])// I know it is for preview.
        LandmarkRow(landmark: landmarks[1])
    }
    
}
    
