//
//  FavouriteButton.swift
//  BigBearWine
//
//  Created by Muhammed Siddiqui on 2025-05-17.
//

import SwiftUI

struct FavouriteButton: View {
    @Binding var isSet: Bool// The binding property wrapper enables you to read and write between a property that stores data and a view that displays and changes the data.
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favourite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavouriteButton(isSet: .constant(true))
}
