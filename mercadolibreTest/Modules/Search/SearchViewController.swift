//
//  ViewController.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import UIKit

class SearchViewController: UIViewController, BaseViewControllerProtocol {
    // MARK: - Properties
    private var dataSource: DataSource<ProductProtocol> = DataSource(type: .mainResults)
    private var allProductsList: [ProductProtocol] = []
    var presenter: SearchPresenterProtocol?
    
    // MARK: - Outlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var mainResultsCollecitonView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var notResultsContainer: UIView!
    
    // MARK: - Actions
    @IBAction func seeAllButtonAction(_ sender: UIButton) {
        presenter?.presentAllProductsList(with: allProductsList)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupUI()
    }
    
    func setupNavigationBar() {
        self.title = "Search"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(cleanData))
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
        dataSource.searchPresenter = presenter
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
    
    @objc func cleanData() {
        dataSource.data = []
        mainResultsCollecitonView.reloadData()
        seeAllButton.isEnabled = false
        notResultsContainer.isHidden = false
        searchBar.text = ""
    }
    
    func showMainProducts(with data: [ProductProtocol]) {
        dataSource.data = data
        DispatchQueue.main.async {
            if !data.isEmpty {
                self.activityIndicator.stopAnimating()
                self.seeAllButton.isEnabled = !data.isEmpty
                self.notResultsContainer.isHidden = true
                self.mainResultsCollecitonView.reloadData()
            }
            
            self.activityIndicator.stopAnimating()
        }
    }
    
    func setAllProductsList(with data: [ProductProtocol]) {
        allProductsList = data
    }
    
    func showErrorAlert(with alert: UIAlertController) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.present(alert, animated: true)
        }
    }
}
