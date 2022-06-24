//
//  ResultsInteractorProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

protocol ResultsInteractorOutputProtocol: AnyObject {}

protocol ResultsInteractorInputProtocol: AnyObject {
    var presenter: ResultsInteractorOutputProtocol? { get set }
}
