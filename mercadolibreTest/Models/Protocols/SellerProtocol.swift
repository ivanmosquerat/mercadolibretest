//
//  SellerProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 20/6/2022.
//

import Foundation

protocol SellerProtocol {
    var id          : Int { get }
    var eshop       : Eshop? { get }
    var reputation  : Reputation? { get }
}
