//
//  ProductResponse.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 20/6/2022.
//

import Foundation

struct ProductResponse: ProductResponseProtocol, Codable {
    var query: String
    var results: [Product]
    
    enum CodingKeys: String, CodingKey {
        case query
        case results
    }
}
