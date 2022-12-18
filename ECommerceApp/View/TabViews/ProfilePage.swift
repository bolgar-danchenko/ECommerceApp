//
//  ProfilePage.swift
//  ECommerceApp
//
//  Created by Konstantin Bolgar-Danchenko on 15.12.2022.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("My Profile")
                        .font(.custom(customFont, size: 28).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 15) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .foregroundColor(Color("MainColor"))
                            .clipShape(Circle())
                            .offset(y: -30)
                            .padding(.bottom, -30)
                        
                        Text("Joe Smith")
                            .font(.custom(customFont, size: 16))
                            .fontWeight(.semibold)
                        
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(.gray)
                                .rotationEffect(.init(degrees: 180))
                            
                            Text("Address: Parkwood Dr, Apt 3\n10220\nCupertino, USA")
                                .font(.custom(customFont, size: 15))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.horizontal, .bottom])
                    .background(
                        Color("HighlightColor")
                            .cornerRadius(12)
                    )
                    .padding()
                    .padding(.top, 40)
                    
                    // Custom navigation links
                    customNavigationLink(title: "Edit Profile") {
                        Text("")
                            .navigationTitle("Edit Profile")
                            .navigationBarTitleDisplayMode(.large)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("BackgroundColor").ignoresSafeArea())
                    }
                    
                    customNavigationLink(title: "Payment Methods") {
                        Text("")
                            .navigationTitle("Payment Methods")
                            .navigationBarTitleDisplayMode(.large)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("BackgroundColor").ignoresSafeArea())
                    }
                    
                    customNavigationLink(title: "Shipping Address") {
                        Text("")
                            .navigationTitle("Shipping Address")
                            .navigationBarTitleDisplayMode(.large)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("BackgroundColor").ignoresSafeArea())
                    }
                    
                    customNavigationLink(title: "Order History") {
                        Text("")
                            .navigationTitle("Order History")
                            .navigationBarTitleDisplayMode(.large)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("BackgroundColor").ignoresSafeArea())
                    }
                    
                    customNavigationLink(title: "Notifications") {
                        Text("")
                            .navigationTitle("Notifications")
                            .navigationBarTitleDisplayMode(.large)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("BackgroundColor").ignoresSafeArea())
                    }
                }
                .padding(.horizontal, 22)
                .padding(.vertical, 20)
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("BackgroundColor")
                    .ignoresSafeArea()
            )
        }
    }
    
    // Avoding new structs
    @ViewBuilder
    func customNavigationLink<Detail: View>(title: String, @ViewBuilder content: @escaping () -> Detail) -> some View {
        
        NavigationLink {
            content()
        } label: {
            HStack {
                Text(title)
                    .font(.custom(customFont, size: 17))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(.black)
            .padding()
            .background(
                Color("HighlightColor")
                    .cornerRadius(12)
            )
            .padding(.horizontal)
            .padding(.top, 10)
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
