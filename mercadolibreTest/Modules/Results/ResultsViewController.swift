//
//  ResultsViewController.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import UIKit

class ResultsViewController: UIViewController, BaseViewControllerProtocol {
    // MARK: - Properties
    private var dataSource: DataSource<ProductProtocol> = DataSource(type: .allResults)
    var presenter: ResultsPresenterProtocol?
    var allProductsList: [ProductProtocol] = []
    
    // MARK: - Outlets
    @IBOutlet weak var resultsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupUI()
    }
    
    func setupController() {
        let interactor = ResultsInteractor()
        let router = ResultsRouter()
        presenter = ResultsPresenter()
        presenter?.interactor = interactor
        presenter?.view = self
        presenter?.router = router
        interactor.presenter = presenter as? ResultsInteractorOutputProtocol
        dataSource.resultsPresenter = presenter
        dataSource.data = allProductsList
    }
}

// MARK: - UI
extension ResultsViewController {
    func setupNavigationBar() {
        self.title = "Results"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupUI() {
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        resultsCollectionView.dataSource = dataSource
        resultsCollectionView.delegate = dataSource
        resultsCollectionView.register(UINib(nibName: "MainResultsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mainResultCell")
    }
}

extension ResultsViewController: ResultsViewProtocol {}
