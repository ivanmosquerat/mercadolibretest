//
//  SearchViewProtocol.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation
import UIKit

protocol SearchViewProtocol: AnyObject {
    var presenter: SearchPresenterProtocol? { get set }
    
    func cleanData()
    func showMainProducts(with data: [ProductProtocol])
    func setAllProductsList(with data: [ProductProtocol])
    func showErrorAlert(with alert: UIAlertController)
}
