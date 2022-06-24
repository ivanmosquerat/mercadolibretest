//
//  DetailsPresenter.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

class DetailsPresenter: DetailsPresenterProtocol {
    weak var view: DetailsViewProtocol?
    var interactor: DetailsInteractorInputProtocol?
    var router: DetailsRouterProtocol?
}

extension DetailsPresenter: DetailsInteractorOutputProtocol {}
