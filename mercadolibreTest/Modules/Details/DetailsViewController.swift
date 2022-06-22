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
    var product: ProductProtocol?
    
    // MARK: - Outlets
    @IBOutlet private weak var titleProductLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var availableQuantityLabel: UILabel!
    @IBOutlet private weak var sellerNameLabel: UILabel!
    @IBOutlet private weak var sellerIdLabel: UILabel!
    @IBOutlet private weak var sellerReputationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupNavigationBar() {
        self.title = "Detail"
        self.navigationController?.navigationBar.prefersLargeTitles = false
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
    
    private func setupUI() {
        setupNavigationBar()
        guard let product = product else {
            return
        }

        titleProductLabel.text = product.title
        priceLabel.text = "\(product.price)"
        availableQuantityLabel.text = "Available: \(product.availableQuantity)"
        sellerNameLabel.text = product.seller?.eshop?.nickName
        sellerIdLabel.text = "ID: \(product.seller?.eshop?.sellerId ?? 0)"
        sellerReputationLabel.text = "Reputation: \(product.seller?.reputation?.sellerStatus ?? "")"
    }
}

extension DetailsViewController: DetailsViewProtocol {}
