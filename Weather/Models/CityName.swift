//
//  CityName.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/5/22.
//

import Foundation

// MARK: - CityName
struct CityName: Decodable {
    let name: String
    let lat, lon: Double
    let country, state: String
}
