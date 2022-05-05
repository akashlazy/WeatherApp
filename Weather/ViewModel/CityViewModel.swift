//
//  CityViewModel.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/5/22.
//

import Foundation

class CityViewModel {
    
    private let cityApi = CityApiRepository()
    private var cityNames: [CityName] = []
    
    func getCity(by name: String, completionSucess: @escaping (Bool) -> Void) {
        cityApi.getCity(text: name, completionHandler: { city in
            if let _ = city {
                self.cityNames = city ?? []
                completionSucess(true)
            } else {
                completionSucess(false)
            }
        })
    }
    
    func loadCity(completion: @escaping (Bool) -> Void) {
        let json = JsonExtension(fileName: "City")
        json.getJson([CityName].self) { city in
//            self.cityNames = city ?? []
            completion(true)
        }
    }
    
    func numberOfCity() -> Int {
        return cityNames.count
    }
    
    func displayCity(_ index: Int) -> String {
        if !cityNames.isEmpty {
            let city = cityNames[index]
            return city.name + ", " + city.state + ", " + city.country
        }
        return ""
    }
}
