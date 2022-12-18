//
//  HomeViewModel.swift
//  ECommerceApp
//
//  Created by Konstantin Bolgar-Danchenko on 15.12.2022.
//

import SwiftUI
import Combine // Using Combine to monitor search field

class HomeViewModel: ObservableObject {
    
    @Published var productType: ProductType = .appleWatch
    
    @Published var products: [Product] = [
        
        Product(type: .appleWatch, title: "Apple Watch", subtitle: "Series 6: Silver", price: "$459", productImage: "AppleWatch6"),
        Product(type: .appleWatch, title: "Apple Watch", subtitle: "Series 3: Silver", price: "$259", productImage: "AppleWatch3"),
        Product(type: .appleWatch, title: "Apple Watch", subtitle: "Series 4: Silver", price: "$359", productImage: "AppleWatch4"),
        
        Product(type: .iPhone, title: "iPhone 13", subtitle: "A15 - Blue", price: "$599", productImage: "iPhone13"),
        Product(type: .iPhone, title: "iPhone 13 Pro", subtitle: "A15 - Ocean Blue", price: "$699", productImage: "iPhone13Pro"),
        Product(type: .iPhone, title: "iPhone XS Max", subtitle: "A12 - Black", price: "$499", productImage: "iPhoneXSMax"),
        Product(type: .iPhone, title: "iPhone SE", subtitle: "A13 - Red", price: "$399", productImage: "iPhoneSE"),
        
        Product(type: .iPad, title: "iPad", subtitle: "A13 - Black", price: "$499", productImage: "iPad"),
        Product(type: .iPad, title: "iPad Air 2", subtitle: "A14 - Gold", price: "$599", productImage: "iPadAir"),
        Product(type: .iPad, title: "iPad Mini", subtitle: "A14 - Gold", price: "$399", productImage: "iPadMini"),
        
        Product(type: .mac, title: "MacBook Pro", subtitle: "M1 - Space Gray", price: "$1299", productImage: "MacBookPro"),
        Product(type: .mac, title: "MacBook Air", subtitle: "Intel Core i5 - Silver", price: "$799", productImage: "MacBookAir"),
        Product(type: .mac, title: "iMac", subtitle: "Intel Core i7", price: "$899", productImage: "iMac")
    ]
    
    // Filtered products
    @Published var filteredProducts: [Product] = []
    
    // More products on the type
    @Published var showMoreProductsOnType: Bool = false
    
    // Search data
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var searchedProducts: [Product]?
    
    var searchCancellable: AnyCancellable?
    
    init() {
        filterProductByType()
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str != "" {
                    self.filterProductBySearch()
                } else {
                    self.searchedProducts = nil
                }
            })
    }
    
    func filterProductByType() {
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
                .lazy
                .filter { product in
                    return product.type == self.productType
                }
            // Limiting result
                .prefix(4)
            
            DispatchQueue.main.async {
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
    
    func filterProductBySearch() {
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
                .lazy
                .filter { product in
                    return product.title.lowercased().contains(self.searchText.lowercased())
                }
            
            DispatchQueue.main.async {
                self.searchedProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
}

