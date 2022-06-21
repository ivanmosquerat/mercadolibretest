//
//  Seller.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 20/6/2022.
//

import Foundation

struct Seller: SellerProtocol, Codable {
    var id: Int
    var eshop: Eshop?
    var reputation: Reputation?
    
    enum CodingKeys: String, CodingKey {
        case id
        case eshop
        case reputation = "seller_reputation"
    }
}
