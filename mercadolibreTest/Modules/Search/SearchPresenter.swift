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
    
    func presentProductDetail(with item: ProductProtocol) {
        guard let view = view else { return }
        router?.presentProductDetail(on: view, with: item)
    }
    
    func presentAllProductsList(with list: [ProductProtocol]) {
        guard let view = view else { return }
        router?.presentAllProductList(on: view, with: list)
    }
    
    func displayMainProducts(with search: String) {
        interactor?.loadMainProducts(with: search)
    }
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    func onSuccessFetchSearch(with data: [ProductProtocol]) {
        guard let filteredData = interactor?.filterData(data: data) else { return }
        
        view?.setAllProductsList(with: data)
        view?.showMainProducts(with: filteredData)
    }
    
    func onErrorFetch() {
        let alert = HandlingErrorManager.errorAlert()
        view?.showErrorAlert(with: alert)
    }
}
