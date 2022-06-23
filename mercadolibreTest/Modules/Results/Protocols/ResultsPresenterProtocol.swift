//
//  ResultsPresenterProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

protocol ResultsPresenterProtocol: AnyObject {
    var view: ResultsViewProtocol? { get set }
    var interactor: ResultsInteractorInputProtocol? { get set }
    var router: ResultsRouterProtocol? { get set }
    
    func presentProductDetail(with item: ProductProtocol)
}
