//
//  ViewController.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import UIKit

class SearchViewController: UIViewController, BaseViewControllerProtocol {
    // MARK: - Properties
    private var dataSource: DataSource = DataSource<ProductProtocol>()
    var presenter: SearchPresenterProtocol?
    
    // MARK: - Outlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var mainResultsCollecitonView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Actions
    @IBAction func seeAllButtonAction(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupUI()
    }
    
    func setupNavigationBar() {
        self.title = "Search"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshData))
    }
    
    func setupController() {
        let interactor = SearchInteractor()
        let router = SearchRouter()
        presenter = SearchPresenter()
        presenter?.interactor = interactor
        presenter?.view = self
        presenter?.router = router
        interactor.presenter = presenter as? SearchInteractorOutputProtocol
        searchBar.delegate = self
    }
}

// MARK: - Search bar
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dataSource.data = []
        guard let search = searchBar.text else { return }
        
        activityIndicator.startAnimating()
        presenter?.displayMainProducts(with: search)
        self.view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
}

// MARK: - UI
extension SearchViewController {
    func setupUI() {
        setupNavigationBar()
        setupMainResultsCollectionView()
    }
    
    private func setupMainResultsCollectionView() {
        mainResultsCollecitonView.dataSource = dataSource
        mainResultsCollecitonView.delegate = dataSource
        mainResultsCollecitonView.register(UINib(nibName: "MainResultsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "mainResultCell")
    }
}

extension SearchViewController: SearchViewProtocol {
    
    
    @objc func refreshData() {
        
    }
    
    func showMainProducts(with data: [ProductProtocol]) {
        dataSource.data = data
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.mainResultsCollecitonView.reloadData()
        }
    }
    
    func showErrorAlert(with alert: UIAlertController) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.present(alert, animated: true)
        }
    }
}
