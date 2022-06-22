//
//  MainResultsCollectionViewCell.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 20/6/2022.
//

import UIKit

class MainResultsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var availableQuantityLabel: UILabel!
    @IBOutlet weak var soldQuantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(with item: ProductProtocol) {
        productTitleLabel.text = item.title
        productPriceLabel.text = "\(item.price)"
        availableQuantityLabel.text = "Available: \(item.availableQuantity)"
        soldQuantityLabel.text = "Sold: \(item.soldQuantity)"
    }
}
