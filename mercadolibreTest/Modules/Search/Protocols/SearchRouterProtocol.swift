//
//  SearchRouterProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation
import UIKit

protocol SearchRouterProtocol {
    func presentProductDetail(on view: SearchViewProtocol, with item: ProductProtocol)
    func presentAllProductList(on view: SearchViewProtocol, with list: [ProductProtocol])
}
