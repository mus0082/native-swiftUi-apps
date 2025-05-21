//
//  CircleImage.swift
//  BigBearWine
//
//  Created by Muhammed Siddiqui on 2025-05-07.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
       image
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .background(Circle()
                .fill(.white))
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 10)
    }
}

#Preview {
    CircleImage(image: Image("wildturkey"))
}
