//
//  ResultsPresenter.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

class ResultsPresenter: ResultsPresenterProtocol {
    weak var view: ResultsViewProtocol?
    var interactor: ResultsInteractorInputProtocol?
    var router: ResultsRouterProtocol?
    
}

extension ResultsPresenter: ResultsInteractorOutputProtocol {
    
}
