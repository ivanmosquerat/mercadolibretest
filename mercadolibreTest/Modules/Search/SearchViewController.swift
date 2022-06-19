//
//  ViewController.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import UIKit

class SearchViewController: UIViewController, BaseViewControllerProtocol {
    var presenter: SearchPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupNavigationBar() {
        
    }
    
    func setupController() {
        let interactor = SearchInteractor()
        let router = SearchRouter()
        presenter = SearchPresenter()
        presenter?.interactor = interactor
        presenter?.view = self
        presenter?.router = router
        interactor.presenter = presenter as? SearchInteractorOutputProtocol
    }
}

extension SearchViewController: SearchViewProtocol {
    
}
