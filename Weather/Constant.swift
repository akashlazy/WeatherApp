//
//  Constant.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import Foundation

struct ApiEndpoints {
    private static let baseURL = "https://api.openweathermap.org/data/2.5"
    static let apiKey = "d7a26e4cd452c49f186ffdc84008a955"
    
    static let weather = baseURL + "/weather"
}
