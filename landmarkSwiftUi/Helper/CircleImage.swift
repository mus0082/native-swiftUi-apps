//
//  CircleImage.swift
//  landmarkSwiftUi
//
//  Created by Muhammed Siddiqui on 2025-03-06.
//

import SwiftUI

struct CircleImage: View {
    var image: Image//The variable have type which is Image property. it could be a system image, an image from your app's assets, or a remote image, depending on how you set it. image will looks like
    
    var body: some View {
        image// now we are makeing
            .clipShape(Circle())// Makes the image circular
            .overlay {
                Circle().stroke(.white, lineWidth: 5)//Adds a white border around the circle
            }
            .shadow(radius: 7)// Adds a shadow effect with a radius of 7

    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
