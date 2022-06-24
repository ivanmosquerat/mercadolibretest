//
//  Networkes.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 18/6/2022.
//

import Foundation

class Networker {
    
    
    /// Generic method to fetch data.
    /// - Parameters:
    ///   - url: url for the request.
    ///   - type: type of the data to decode.
    ///   - search: search entered.
    ///   - completion: closure to manage the success response.
    ///   - failure: closure to manage the failure response.
    class func fetchData<T>(url: URL,
                            type: T.Type,
                            search: String?,
                            completion: @escaping (_ object: T) -> Void,
                            failure: @escaping (_ error: Error) -> Void) where T: Codable {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                failure(error)
                return
            }
            
            guard let jsonData = data else { return }
            let data = try! JSONDecoder().decode(T.self, from: jsonData)
            completion(data)
        }
        task.resume()
    }
}
