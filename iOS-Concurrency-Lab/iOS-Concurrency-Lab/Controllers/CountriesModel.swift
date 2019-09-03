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
}
