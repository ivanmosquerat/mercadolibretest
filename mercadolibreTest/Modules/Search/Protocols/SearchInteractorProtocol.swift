//
//  SearchInteractorProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

protocol SearchInteractorOutputProtocol: AnyObject {
    func onSuccessFetchSearch(with data: [ProductProtocol])
    func onErrorFetch()
}

protocol SearchInteractorInputProtocol: AnyObject {
    var presenter: SearchInteractorOutputProtocol? { get set }
    
    func loadMainProducts(with search: String)
    func filterData(data: [ProductProtocol]) -> [ProductProtocol]
}


