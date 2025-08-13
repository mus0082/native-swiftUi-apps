//
//  ContentView.swift
//  SwiftUIAsyncImageApp
//
//  Created by Muhammed Siddiqui on 2025-06-09.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()// what does that mean if remove . what is this doing here
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .padding()
            .opacity(0.5)
    }
}

struct ContentView: View {
    
    private let imageURL: String = "https://picsum.photos/id/1/200/300"
    
    var body: some View {
        
    //MARK: 1 Basic
      //  AsyncImage (url: URL(string: imageURL))
        
    //MARK: 2 Scale
      //  AsyncImage(url: URL(string: imageURL), scale: 1)// scale 1 means 2 get less 3 get less.
    //MARK: 3 PLACEHOLDER
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image.imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").iconModifier()
//        }
//        .padding(20)
        
        //MARK: 4 PHASE
        //SUCCESS: The Image successfully loaded
        //FAILURE: The Image Failed to load an error
        //EMPTY: No Image is loaded
        
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            if let image = phase.image{
//                image.imageModifier()
//            }else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModifier()
//            }else {
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//        }
//        .padding(40)
        
        //MARK: 5 Animation
        AsyncImage(url: URL(string: imageURL), transaction:
                    Transaction(animation: .spring(response:0.5, dampingFraction: 0.2, blendDuration: 1))) { phase in// i will ask what is this for.
            switch phase {
            case .success (let image):
               image
                   .imageModifier()
                   .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName:"photo.circle.fill").iconModifier()
                @unknown default:
                ProgressView()
            }
            
        }
        
        
    }
}

#Preview {
    ContentView()
}
