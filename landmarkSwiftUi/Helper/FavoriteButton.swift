//
//  FavoriteButton.swift
//  landmarkSwiftUi
//
//  Created by Muhammed Siddiqui on 2025-04-21.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool// binding variable which we are using in Landmark Detail
    
    var body: some View {
        Button {
            isSet.toggle()//on and off, UI Action
        } label: {// native keyword
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")// How it will look like the button actual with Ternary operator if it is true star filled otherwise just star
                .labelStyle(.iconOnly)// Only icon to show.
                .foregroundStyle(isSet ? .yellow : .gray)// if isset true then fill with yellow otherwise gray
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
