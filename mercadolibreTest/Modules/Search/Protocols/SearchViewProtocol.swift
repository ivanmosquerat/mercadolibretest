//
//  SearchViewProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

protocol SearchViewProtocol: AnyObject {
    var presenter: SearchPresenterProtocol? { get set }
}
