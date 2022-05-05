//
//  CityRepository.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/5/22.
//

import Foundation

protocol CityRepository {
    
    func getCity(text: String, completionHandler: @escaping (_ result: [CityName]?) -> Void)
}
