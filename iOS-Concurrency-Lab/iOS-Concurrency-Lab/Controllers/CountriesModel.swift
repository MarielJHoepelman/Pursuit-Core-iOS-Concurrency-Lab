//
//  CountriesModel.swift
//  iOS-Concurrency-Lab
//
//  Created by Mariel Hoepelman on 9/3/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import Foundation
import UIKit

struct Countries: Codable {
    let name: String
    let flag: String
    let capital: String
    let population: Int
    
    static func getCountry(data: Data) -> [Countries]? {
        do {
            let country = try JSONDecoder().decode([Countries].self, from: data)
//            print(country)
            return country
        } catch {//catching errors thrown -> "error"
            print("couldn't decode \(error)")
            return nil
        }
    }
}

struct Country: Codable {
    let name: String
    let flag: String
    let capital: String
    let population: Int
}
