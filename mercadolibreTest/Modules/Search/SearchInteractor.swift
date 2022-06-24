//
//  SearchInteractor.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
    var presenter: SearchInteractorOutputProtocol?
    
    
    /// Use response from the fetch request to load information about products.
    /// - Parameter search: Search entered.
    func loadMainProducts(with search: String) {
        SearchWorker.fetchSearchResults(search: search) { [weak self] result  in
            self?.presenter?.onSuccessFetchSearch(with: result)
        } failure: { [weak self] error in
            self?.presenter?.onErrorFetch()
        }
    }
    
    
    /// Filter data to get the 5 most sold products list.
    /// - Parameter data: All products list.
    /// - Returns: List of 5 most sold products.
    func filterData(data: [ProductProtocol]) -> [ProductProtocol] {
        let filteredData = data.sorted(by: { $0.soldQuantity > $1.soldQuantity }).prefix(5)
        let arrayData =  Array(filteredData)
        
        return arrayData
    }
}
