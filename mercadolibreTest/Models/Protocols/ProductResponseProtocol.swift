//
//  ProductResponseProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 20/6/2022.
//

import Foundation

protocol ProductResponseProtocol {
    var query                   : String { get }
    var results                 : [Product] { get }
}
