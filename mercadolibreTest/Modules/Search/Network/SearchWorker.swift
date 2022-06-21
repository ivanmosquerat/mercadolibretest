//
//  SearchWorker.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

class SearchWorker {
    static func fetchSearchResults(search: String?, completion: @escaping (_ result: [ProductProtocol]) -> Void,
                                   failure: @escaping (_ error: Error) -> Void ) {
        guard let search = search, let url = URLGenerator.urlSearch(search: search) else {
            // TODO: Error handle
            return
        }
        
        Networker.fetchData(url: url, type: ProductResponse.self, search: search, completion: { result in
            print(result)
            completion(result.results)
        }, failure: { error in
            // TODO: Error handle
            print("ERROR!!!!!")
        })
    }
}
