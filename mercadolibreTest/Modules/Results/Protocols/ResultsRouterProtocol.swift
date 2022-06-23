//
//  ResultsRouterProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

protocol ResultsRouterProtocol {
    func presentProductDetail(on view: ResultsViewProtocol, with item: ProductProtocol)
}
