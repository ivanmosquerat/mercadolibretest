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
    
    func presentProductDetail(with item: ProductProtocol) {
        guard let view = view else { return }
        router?.presentProductDetail(on: view, with: item)
    }
}

extension ResultsPresenter: ResultsInteractorOutputProtocol {}
