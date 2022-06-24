//
//  SearchWorker.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

class SearchWorker {
    
    /// Fetch results of the search entered by the user.
    /// - Parameters:
    ///   - search: Search entered on search bar.
    ///   - completion: Managing the results.
    ///   - failure: Managing the error.
    static func fetchSearchResults(search: String?, completion: @escaping (_ result: [ProductProtocol]) -> Void,
                                   failure: @escaping (_ error: Error) -> Void ) {
        guard let search = search, let url = URLGenerator.urlSearch(search: search) else { return }
        
        Networker.fetchData(url: url, type: ProductResponse.self, search: search, completion: { result in
            completion(result.results)
        }, failure: { error in
            failure(error)
        })
    }
}
