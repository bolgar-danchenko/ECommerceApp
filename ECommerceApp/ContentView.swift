//
//  ContentView.swift
//  ECommerceApp
//
//  Created by Konstantin Bolgar-Danchenko on 15.12.2022.
//

import SwiftUI

struct ContentView: View {
    // Log status
    @AppStorage("log_status") var log_status: Bool = false
    
    var body: some View {
        Group {
            if log_status {
                MainPage()
            } else {
                OnBoardingPage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
