//
//  SearchPresenter.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

class SearchPresenter: SearchPresenterProtocol {
    var view: SearchViewProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?
    
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    
}
