//
//  URLGenerator.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

class URLGenerator {
    private static let baseUrl          = "https://api.mercadolibre.com"
    private static let searchUrl        = "/sites/MLA/search?q="
    
    class func urlSearch(search: String) -> URL? {
        guard let urlString = "\(baseUrl)\(searchUrl)\(search)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        return url
    }
}
