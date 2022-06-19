//
//  DetailsViewProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

protocol DetailsViewProtocol: AnyObject {
    var presenter: DetailsPresenterProtocol? { get set }
    
}
