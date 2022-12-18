//
//  MainPage.swift
//  ECommerceApp
//
//  Created by Konstantin Bolgar-Danchenko on 15.12.2022.
//

import SwiftUI

struct MainPage: View {
    
    // Current tab
    @State var currentTab: Tab = .Home
    
    @StateObject var sharedData: SharedDataModel = SharedDataModel()
    
    @Namespace var animation
    
    // Hiding tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        // Tab view
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                
                Home(animation: animation)
                    .environmentObject(sharedData)
                    .tag(Tab.Home)
                
                LikedPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Liked)
                
                ProfilePage()
                    .tag(Tab.Profile)
                
                CartPage()
                    .environmentObject(sharedData)
                    .tag(Tab.Cart)
            }
            
            // Custom tab bar
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button {
                        // updating tab
                        currentTab = tab
                    } label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                        // Applying shadow
                            .background(Color("MainColor")
                                .opacity(0.1)
                                .cornerRadius(5)
                                .blur(radius: 5)
                                .padding(-7)
                                .opacity(currentTab == tab ? 1 : 0))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("MainColor") : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)
        }
        .background(Color("BackgroundColor").ignoresSafeArea())
        .overlay(
            ZStack {
                // Detail page
                if let product = sharedData.detailProduct, sharedData.showDetailProduct {
                    ProductDetailView(product: product, animation: animation)
                        .environmentObject(sharedData)
                    // Adding transitions
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .opacity))
                }
            }
        )
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

// Making case iteratable
// Tab cases
enum Tab: String, CaseIterable {
    case Home = "home"
    case Liked = "liked"
    case Profile = "profile"
    case Cart = "cart"
}
