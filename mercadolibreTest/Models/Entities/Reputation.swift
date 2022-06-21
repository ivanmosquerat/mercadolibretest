//
//  Reputation.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 20/6/2022.
//

import Foundation

struct Reputation: ReputationProtocol, Codable {
    var sellerStatus: String?
    
    enum CodingKeys: String, CodingKey {
        case sellerStatus = "power_seller_status"
    }
}
