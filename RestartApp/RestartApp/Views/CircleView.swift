//
//  CircleView.swift
//  RestartApp
//
//  Created by Muhammed Siddiqui on 2025-06-25.
//

import SwiftUI

struct CircleView: View {
    
    var Colour: Color
    var opacity: Double
    
    var body: some View {
        ZStack{
           
            
            ZStack{
                ZStack{
                    Circle()
                        .stroke(Colour.opacity(opacity), lineWidth: 80)
                        .frame(width: 260, height: 260, alignment: .center)
                    
                    Circle()
                        .stroke(Colour.opacity(opacity), lineWidth: 40)
                        .frame(width: 260, height: 260, alignment: .center)
                }
            }
        }
    }
}

#Preview {
    ZStack{
        Color("ColorBlue")
        CircleView( Colour: Color.white, opacity: 0.2)
    }
}
