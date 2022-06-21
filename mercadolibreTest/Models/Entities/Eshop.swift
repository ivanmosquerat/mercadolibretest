//
//  Eshop.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 20/6/2022.
//

import Foundation

struct Eshop: EshopProtocol, Codable {
    var sellerId: Int
    var nickName: String
    var siteId: String
   
    enum CodingKeys: String, CodingKey {
        case sellerId       = "seller"
        case nickName       = "nick_name"
        case siteId         = "site_id"
    }
}
