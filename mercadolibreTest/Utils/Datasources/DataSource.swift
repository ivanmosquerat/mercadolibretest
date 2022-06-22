//
//  DataSource.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation
import UIKit

final class DataSource<T>:  NSObject,
                            UICollectionViewDelegate,
                            UICollectionViewDataSource,
                            UICollectionViewDelegateFlowLayout {
    
    weak var searchPresenter: SearchPresenterProtocol?
    weak var resultsPresenter: ResultsPresenterProtocol?
    var data: [T] = []
    
    // MARK: - DataSource
    
    // TODO: add init
    
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
        searchPresenter?.presentProductDetail(with: product)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
}
