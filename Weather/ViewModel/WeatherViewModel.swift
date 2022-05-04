//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import Foundation

struct WeatherViewModel {
    
    private let weatherApi = WeatherApiRepository()
    
    func getWeather(_ request: LocationWeatherRequest, completion: @escaping (CityWeather?) -> Void) {
        weatherApi.getWeather(request: request) { cityWeather in
            completion(cityWeather)
        }
    }
}
