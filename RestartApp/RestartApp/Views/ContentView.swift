//
//  ContentView.swift
//  RestartApp
//
//  Created by Muhammad Siddiqui on 2025-06-10.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onBoardingView") var restartApp: Bool = true// key should be same as along with other views.
    
    var body: some View {
        ZStack {
            if restartApp {
                OnBoardingView()
            }else{
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
