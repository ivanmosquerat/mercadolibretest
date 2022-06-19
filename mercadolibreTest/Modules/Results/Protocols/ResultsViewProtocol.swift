//
//  ResultsViewProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

protocol ResultsViewProtocol: AnyObject {
    var presenter: ResultsPresenterProtocol? { get set }
}
