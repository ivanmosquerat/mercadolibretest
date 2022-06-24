//
//  DataSource.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation
import UIKit

enum TypeCell: Int, CaseIterable {
    case mainResults
    case allResults
}

final class DataSource<T>:  NSObject,
                            UICollectionViewDelegate,
                            UICollectionViewDataSource {
    
    weak var searchPresenter: SearchPresenterProtocol?
    weak var resultsPresenter: ResultsPresenterProtocol?
    var data: [T] = []
    var type: TypeCell
    
    init(type: TypeCell) {
        self.type = type
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainResultCell", for: indexPath) as? MainResultsCollectionViewCell, let item = data[indexPath.row] as? ProductProtocol else {
            return UICollectionViewCell()
        }
        cell.setupCell(with: item)
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = data[indexPath.row] as? ProductProtocol else { return }
        
        switch type {
        case .mainResults:
            searchPresenter?.presentProductDetail(with: product)
        case .allResults:
            resultsPresenter?.presentProductDetail(with: product)
        }
    }
}
