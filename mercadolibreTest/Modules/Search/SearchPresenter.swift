//
//  SearchPresenter.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

class SearchPresenter: SearchPresenterProtocol {
    weak var view: SearchViewProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?
    
    func displayMainProducts(with search: String) {
        interactor?.loadMainProducts(with: search)
    }
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    func onSuccessFetchSearch(with data: [ProductProtocol]) {
        
    }
    
    func onErrorFetch() {
        
    }
}
