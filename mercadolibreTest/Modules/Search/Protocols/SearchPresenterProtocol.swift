//
//  SearchPresenterProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

protocol SearchPresenterProtocol: AnyObject {
    var view: SearchViewProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var router: SearchRouterProtocol? { get set }
    
    func presentProductDetail(with item: ProductProtocol)
    func presentAllProductsList(with list: [ProductProtocol])
    func displayMainProducts(with search: String)
}
