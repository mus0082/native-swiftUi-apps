//
//  HomeView.swift
//  RestartApp
//
//  Created by Muhammed Siddiqui on 2025-06-22.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onBoardingView") var homeViewShown: Bool = false
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
        ZStack {
            CircleView(Colour: .gray, opacity: 0.2)
                
                
                
//                Circle()
//                    .stroke(Color.gray.opacity(0.2), lineWidth: 80)
//                    .frame(width: 260, height: 260, alignment: .center)
//                Circle()
//                    .stroke(Color.gray.opacity(0.2), lineWidth: 40)
//                    .frame(width: 260, height: 260, alignment: .center)
            Image("character-2")
                .resizable()
                .scaledToFit()
                .offset(y: isAnimated ? 0 : -40)
                .animation(.easeOut(duration: 4).repeatForever(), value: isAnimated)
        }
        .padding()
        
        Spacer()
        
        HStack{
            Text("""
            The time that leads to mastery is
            dependent on the intensity of our focus.
            """)
            .font(.system(.title3))
            .foregroundStyle(.gray)
            .multilineTextAlignment(.center)
        }
        .padding()
        Spacer()
        
        
            HStack{
                Button(action: {
                    withAnimation {
                        playSound(sound: "success", type: "m4a")
                        homeViewShown =  true
                    }
                }) {
                    Label("Restart", systemImage: "repeat.circle.fill")
                           .font(.system(size: 15, weight: .bold))
                           .padding()// always use padding first right after text.
                           .background(Color("ColorBlue"))
                           .foregroundStyle(.white)
                           .clipShape(RoundedRectangle(cornerRadius: 50))
                }
            }
        }
        .onAppear(perform: {
            isAnimated = true
        })
    }
}

#Preview {
    HomeView()
}
