//
//  HttpRequest.swift
//  Shaadi-Swift
//
//  Created by Bhooshan Patil on 12/02/21.
//

import Foundation

internal enum HTTPMethod : String {
    
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}
internal enum EndPoints {
    case get_users
    case get_photos
    var value:URL
    {
        switch self
        {
        case .get_users:
            return URL(string: "https://jsonplaceholder.typicode.com/users")!
        case .get_photos:
            return URL(string: "https://jsonplaceholder.typicode.com/photos")!
        }
    }
    
}

internal class DataRequest {
    
    internal func fetchData<T:Decodable>(for endpoint:EndPoints,
                                         withMethod httpMethod:HTTPMethod,
                                         queryParams:[String:Any]?,
                                         bodyparams:[String:Any]?,
                                         completionHandler:@escaping (Result<T,AppError>) -> Void){
        
        var request = URLRequest(url: endpoint.value, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.appendBodyParams(body: bodyparams)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                
                completionHandler(.failure(AppError(message: "com.shaddi.internalerror", devMessage: error?.localizedDescription, code: nil)));
                return
            }
            data.log()
            do
            {
                completionHandler(.success( try JSONDecoder().decode(T.self, from: data)))
            }
            catch
            {
                completionHandler(.failure(AppError(message: "com.shaddi.internalerror", devMessage: "something went wrong please try again later !", code: nil)));
                
            }
        }
        task.resume()
    }
}
extension Data {
    
    func log() -> Void {
        if let jsonResponse = try? JSONSerialization.jsonObject(with: self, options: []) {
            print( "response: \(jsonResponse)");
        }
    }
}
extension URLRequest {
    
    mutating func appendBodyParams(body:[String:Any]?) -> Void {
        if let body = body {
            let jsonData = try? JSONSerialization.data(withJSONObject: body)
            self.httpBody = jsonData
        }
    }
}
