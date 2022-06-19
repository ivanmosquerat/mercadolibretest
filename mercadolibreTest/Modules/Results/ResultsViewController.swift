//
//  ResultsViewController.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import UIKit

class ResultsViewController: UIViewController, BaseViewControllerProtocol {
    private var dataSource: DataSource<ProductProtocol>?
    var presenter: ResultsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupNavigationBar() {
        
    }
    
    func setupController() {
        let interactor = ResultsInteractor()
        let router = ResultsRouter()
        presenter = ResultsPresenter()
        presenter?.interactor = interactor
        presenter?.view = self
        presenter?.router = router
        interactor.presenter = presenter as? ResultsInteractorOutputProtocol
        dataSource?.resultsPresenter = presenter
    }
}

extension ResultsViewController: ResultsViewProtocol {
    
}
