//
//  SearchInteractor.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
    var presenter: SearchInteractorOutputProtocol?
    
    func loadMainProducts(with search: String) {
        SearchWorker.fetchSearchResults(search: search) { [weak self] result  in
            self?.presenter?.onSuccessFetchSearch(with: result)
        } failure: { error in
            // TODO: Error handling
        }
    }
}
