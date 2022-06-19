//
//  ProductProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

protocol ProductProtocol {
    var id                      : String { get }
    var siteId                  : String { get }
    var title                   : String { get }
    //var seller                : Seller { get }
    var price                   : Float { get }
    var availableQuantity       : Int { get }
    var soldQuantity            : Int { get }
    var condition               : String { get }
    var thumbnail               : String { get }
}
