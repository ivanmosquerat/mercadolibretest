//
//  ResultsRouter.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation
import UIKit

class ResultsRouter: ResultsRouterProtocol {
    func presentProductDetail(on view: ResultsViewProtocol, with item: ProductProtocol) {
        let viewController = DetailsViewController()
        viewController.product = item
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
