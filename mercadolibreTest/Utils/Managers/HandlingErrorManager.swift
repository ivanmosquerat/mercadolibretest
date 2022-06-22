//
//  HandlingErrorManager.swift
//  mercadolibreTest
//
//  Created by Ivan Mosquera on 21/6/2022.
//

import Foundation
import UIKit

class HandlingErrorManager {
    class func errorAlert() -> UIAlertController {
        let alert = UIAlertController(title: "UPS!", message: "Algo salió mal, intentalo mas tarde.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        return alert
    }
}
