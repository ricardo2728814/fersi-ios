//
//  Product.swift
//  fersi
//
//  Created by Ricardo Romero on 5/11/19.
//  Copyright © 2019 Ricardo Romero. All rights reserved.
//

import Foundation

class Product {
    var name: String
    var description: String
    var price: Double
    var images: Array<String>
    
    init(
            name: String,
            description: String,
            price: Double,
            images: Array<String>
        ) {
        self.name = name
        self.description = description
        self.price = price
        self.images = images
    }
}
