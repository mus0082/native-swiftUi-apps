//
//  OnBoardingView.swift
//  RestartApp
//
//  Created by Muhammed Siddiqui on 2025-06-22.
//

import SwiftUI
import AVFoundation


struct OnBoardingView: View {
    @AppStorage("onBoardingView") var onBoardingView: Bool = true
    @State var isAnimated: Bool = false
    
    var buttonWidth: CGFloat = UIScreen.main.bounds.width - 40
    @State var buttonOffset: CGFloat = 0
    @State var isAnimating: Bool = false
    @State var imageOffset: CGSize = .zero
    @State var titleName: String = "Share."
    @State var indicatorValue: Double = 1.0
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            
            Spacer()
            VStack(spacing: 8) {
                VStack{
                    Text(titleName)
                        .font(.system(size: 60, weight: .heavy))
                        .foregroundColor(.white)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1.0), value: isAnimating)
                    Text("""
                        It's not how much we give but
                        how much love we putting into giving.
                    """)// i need to understand how it works if i change placement of text.
                    .foregroundColor(.white)
                    .font(.system(.title3))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 1 : 0)
                    .animation(.easeOut(duration: 1.0), value: isAnimating)
                }
                
                .opacity(isAnimating ? 1 : 0)// once true then show animation opacity
                .offset(y: isAnimating ? 0 : -40)// 0 means orignal position and - 40 is showing top to orignal position animation if its true 0 and animation show miliseconds view is taking to load thats why false
                .animation(.easeOut(duration: 0.5), value: isAnimating)// easeout means value means false noting will show like in animation, but true it will show animation. animation effect
                
                Spacer()
                
                ZStack {
                   ZStack{
                       CircleView(Colour: .white, opacity: 0.2)
                       
                           .blur(radius: 2.0)
                           .offset(x: -imageOffset.width)// i need to understand this code. multiply
                           .gesture(
                            DragGesture()
                           .onChanged { gesture in
                               imageOffset = gesture.translation
                           }
                                .onEnded({ _ in
                                    withAnimation(.spring()){
                                        imageOffset = .zero
                                    }
                                    
                                })
                            )
//                      .stroke(Color.white.opacity(0.2), lineWidth: 80)
//                      .frame(width: 260, height: 260, alignment: .center)
//                        
//                        
//                     Circle()
//                      .stroke(Color.white.opacity(0.2), lineWidth: 40)
//                       .frame(width: 260, height: 260, alignment: .center)
                    }
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0) // value will double thats why image will move little faster, so multiply 1.2
                        .rotationEffect(.degrees(imageOffset.width / 10))
                        .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                withAnimation(.linear(duration: 0.25)) {
                                    if abs(imageOffset.width) <= 150 {//left side scroll - value will save in abs means positive.
                                        imageOffset = gesture.translation// real value coming out from this gesture .transaltion
                                        titleName = "Give."
                                        indicatorValue = 0
                                        
                                    }
                                }
                            }
                            .onEnded  { _ in
                                imageOffset = .zero
                                titleName = "Share."
                                indicatorValue = 1.0
                            }
                        )
                    
                }
               // Spacer()
                
                Image(systemName: "arrow.left.and.right.circle")
                    .foregroundStyle(.white)
                    .font(.system(size: 44, weight: .ultraLight))
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: 10)
                    .animation(.easeOut(duration: 1.0).delay(2), value: isAnimating)
                    .opacity(indicatorValue)
                
                ZStack{
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Get Started")
                        .foregroundStyle(.white)
                        .font(.system(.title3, design: .rounded, weight: .bold))
                        .offset(x: 20)
                    
                    HStack {
                         Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    
                    
                    
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(Color.black.opacity(0.2))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .offset(x: buttonOffset)
                        .foregroundStyle(.white)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                       buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonWidth - 80
                                        withAnimation(Animation.easeOut(duration: 0.5)) {
                                            onBoardingView = false
                                            playSound(sound: "chimeup", type: "mp3")
                                          
                                        }
                                       
                                    } else {
                                        buttonOffset = 0
                                    }
                                }
                            )
                        .sensoryFeedback(.impact(flexibility: .rigid), trigger: buttonOffset)
                        Spacer()
                        
                    }
                }
                .frame(width: buttonWidth, height: 80)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 2), value: isAnimating)
            }
        }
        .onAppear(perform: {// onappear and view totally appear then true, that what it means
            isAnimating = true
        })
    }
}

#Preview {
    OnBoardingView()
}
