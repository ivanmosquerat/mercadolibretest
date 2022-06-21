//
//  DetailsViewController.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import UIKit

class DetailsViewController: UIViewController, BaseViewControllerProtocol {
    // MARK: - Properties
    var presenter: DetailsPresenterProtocol?
    
    // MARK: - Outlets
    @IBOutlet private weak var titleProductLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var availableQuantityLabel: UILabel!
    @IBOutlet private weak var sellerNameLabel: UILabel!
    @IBOutlet private weak var sellerIdLabel: UILabel!
    @IBOutlet private weak var sellerReputationLabel: UILabel!
    
    
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
