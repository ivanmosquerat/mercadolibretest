//
//  DetailsViewController.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import UIKit

class DetailsViewController: UIViewController, BaseViewControllerProtocol {
    var presenter: DetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupNavigationBar() {
        
    }
    
    func setupController() {
        let interactor = DetailsInteractor()
        let router = DetailsRouter()
        presenter = DetailsPresenter()
        presenter?.interactor = interactor
        presenter?.router = router
        presenter?.view = self
        interactor.presenter = presenter as? DetailsInteractorOutputProtocol
    }
}

extension DetailsViewController: DetailsViewProtocol {
    
}
