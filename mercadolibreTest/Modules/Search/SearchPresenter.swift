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
        let filteredData = data.sorted(by: { $0.soldQuantity > $1.soldQuantity }).prefix(5)
        let arrayData =  Array(filteredData)
        
        view?.showMainProducts(with: arrayData)
    }
    
    func onErrorFetch() {
        let alert = HandlingErrorManager.errorAlert()
        view?.showErrorAlert(with: alert)
    }
}
