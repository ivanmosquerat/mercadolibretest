//
//  mercadolibreTestTests.swift
//  mercadolibreTestTests
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import XCTest
@testable import mercadolibreTest

class mercadolibreTestTests: XCTestCase {
    // MARK: - Testing fetch
    func testFetchProducts() {
        let productsExpectations = expectation(description: "Retrive products list")
        SearchWorker.fetchSearchResults(search: "iPhone", completion: { products in
            XCTAssertNotNil(products, "Products list should not be nil.")
            productsExpectations.fulfill()
        }, failure: { error in
            XCTAssertNil(error, "Products list fetch was not successful")
        })
        wait(for: [productsExpectations], timeout: 5.0)
    }
    
    func testFilterProducts() {
        let interactor = SearchInteractor()
        let productsOriginalList = [
            Product(id: "1", siteId: "MLI", title: "iphone 11", price: 1200.0, availableQuantity: 10, soldQuantity: 30, condition: "New", thumbnail: ""),
            Product(id: "2", siteId: "MLI", title: "iphone 11 pro", price: 1000.0, availableQuantity: 8, soldQuantity: 50, condition: "New", thumbnail: ""),
            Product(id: "3", siteId: "MLI", title: "iphone 7 plus", price: 600.0, availableQuantity: 15, soldQuantity: 21, condition: "New", thumbnail: ""),
            Product(id: "4", siteId: "MLI", title: "iphone 8", price: 800.0, availableQuantity: 9, soldQuantity: 1, condition: "New", thumbnail: ""),
            Product(id: "5", siteId: "MLI", title: "iphone xr", price: 900.0, availableQuantity: 20, soldQuantity: 6, condition: "New", thumbnail: ""),
            Product(id: "6", siteId: "MLI", title: "iphone 13", price: 1400.0, availableQuantity: 11, soldQuantity: 5, condition: "New", thumbnail: ""),
            Product(id: "7", siteId: "MLI", title: "iphone x", price: 1000.0, availableQuantity: 11, soldQuantity: 7, condition: "New", thumbnail: ""),
            Product(id: "8", siteId: "MLI", title: "iphone 11", price: 1200.0, availableQuantity: 4, soldQuantity: 40, condition: "New", thumbnail: ""),
            Product(id: "9", siteId: "MLI", title: "iphone 12 mini", price: 1100.0, availableQuantity: 2, soldQuantity: 23, condition: "New", thumbnail: "")
        ]
        
        let filteredData = interactor.filterData(data: productsOriginalList)
        XCTAssertTrue(filteredData.count == 5, "Filter products list has 5 products.")
        XCTAssertTrue(filteredData[0].soldQuantity > filteredData[1].soldQuantity, "Filter products list is sorted by sold quantity.")
    }
}
