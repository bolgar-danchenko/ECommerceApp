//
//  Product.swift
//  ECommerceApp
//
//  Created by Konstantin Bolgar-Danchenko on 15.12.2022.
//

import SwiftUI

// Product model
struct Product: Identifiable, Hashable {
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}


// Product types
enum ProductType: String, CaseIterable {
    case appleWatch = "Apple Watch"
    case mac = "Mac"
    case iPhone = "iPhone"
    case iPad = "iPad"
}

