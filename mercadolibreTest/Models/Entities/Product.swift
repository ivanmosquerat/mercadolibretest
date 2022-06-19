//
//  Product.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

struct Product: ProductProtocol, Codable {
    var id: String
    var siteId: String
    var title: String
    var price: Float
    var availableQuantity: Int
    var soldQuantity: Int
    var condition: String
    var thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case siteId = "site_id"
        case title
        case price
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case condition
        case thumbnail
    }
}
