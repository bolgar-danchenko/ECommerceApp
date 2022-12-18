//
//  MoreProductsView.swift
//  ECommerceApp
//
//  Created by Konstantin Bolgar-Danchenko on 15.12.2022.
//

import SwiftUI

struct MoreProductsView: View {
    var body: some View {
        VStack {
            Text("More Items")
                .font(.custom(customFont, size: 24).bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Group {
                Text("No items yet")
                    .font(.custom(customFont, size: 25))
                    .fontWeight(.semibold)
                    .padding(.top, 80)
                
                Text("New items will appear on this page")
                    .font(.custom(customFont, size: 18))
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("BackgroundColor").ignoresSafeArea())
    }
}

struct MoreProductsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreProductsView()
    }
}
