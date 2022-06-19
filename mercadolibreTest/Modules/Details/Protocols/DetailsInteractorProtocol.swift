//
//  DetailsInteractorProctocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

protocol DetailsInteractorOutputProtocol: AnyObject {
    
}

protocol DetailsInteractorInputProtocol: AnyObject {
    var presenter: DetailsInteractorOutputProtocol? { get set }
}
