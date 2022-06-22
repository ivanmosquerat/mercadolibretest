//
//  SearchRouter.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation
import UIKit

class SearchRouter: SearchRouterProtocol {
    func presentProductDetail(on view: SearchViewProtocol, with item: ProductProtocol) {
        let viewController = DetailsViewController()
        viewController.product = item
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func presentAllProductList(on view: SearchViewProtocol, with list: [ProductProtocol]) {
        let viewController = ResultsViewController()
        viewController.allProductsList = list
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
}
