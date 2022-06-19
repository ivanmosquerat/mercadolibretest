//
//  URLGenerator.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

class URLGenerator {
    private static let baseUrl          = "https://api.mercadolibre.com"
    private static let search           = "/sites/MLA/search?q="
    
    class func urlSearch() -> URL {
        let urlString = baseUrl
        
        guard let url = URL(string: urlString) else {
            fatalError("Url was not generated")
        }
        
        return url
    }
}
