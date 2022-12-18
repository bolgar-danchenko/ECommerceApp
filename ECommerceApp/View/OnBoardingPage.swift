//
//  OnBoardingPage.swift
//  ECommerceApp
//
//  Created by Konstantin Bolgar-Danchenko on 15.12.2022.
//

import SwiftUI

struct OnBoardingPage: View {
    // Showing login page
    @State var showLoginPage: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Welcome to\nGadget Store")
                .font(.custom(customFont, size: 50))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 70)
            
            Spacer()
            
            Button {
                withAnimation {
                    showLoginPage = true
                }
            } label: {
                Text("Continue")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("MainColor"))
            }
            .padding(.top, 200)
            .padding(.horizontal, 30)
            // Adjustments for larger displays
            .offset(y: getRect().height < 750 ? 20 : 40)
            
            Spacer()
        }
        .padding()
        .padding(.top, getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("MainColor"))
        
        .overlay(
            Group {
                if showLoginPage {
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
