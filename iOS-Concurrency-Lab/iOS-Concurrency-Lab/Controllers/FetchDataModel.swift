//
//  FetchDataModel.swift
//  iOS-Concurrency-Lab
//
//  Created by Mariel Hoepelman on 9/3/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import Foundation
import UIKit

struct APIClient {
    static let shared = APIClient()
    
    enum FetchUserErrors: Error {
        case remoteResponseError
        case noDataError
        case badDecodeError
        case badURLError
        case badHttpResponseCode
    }
        
    func fetchDataForAnyURL(url: String, completionHandler: @escaping (Result<Data,Error>) -> () ) {
        
        guard let url = URL(string: url) else {completionHandler(.failure(FetchUserErrors.badURLError))
            return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {completionHandler(.failure(FetchUserErrors.remoteResponseError))
                return
            }
            
            guard let data = data else {completionHandler(.failure(FetchUserErrors.noDataError))
                return
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {completionHandler(.failure(FetchUserErrors.badDecodeError))
                return
            }
            
            switch urlResponse.statusCode {
            case 200...299:
                completionHandler(.success(data))
            default:
                completionHandler(.failure(FetchUserErrors.badHttpResponseCode))
            }
            }.resume()
    }
}
