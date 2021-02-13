//
//  ShaadiError.swift
//  Shaadi-Swift
//
//  Created by Bhooshan Patil on 12/02/21.
//

import Foundation

// MARK: - Custom Error
class AppError: Codable ,Error {
    var message:String
    var devMessage, code: String?
    
    init(message: String, devMessage: String?, code: String?) {
        self.message = message
        self.devMessage = devMessage
        self.code = code
    }
}
