//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import Foundation

struct WeatherViewModel {
    
    private let weatherApi = WeatherApiRepository()
    private let cityWeather: CityWeather
    
    func getWeather(_ request: LocationWeatherRequest, completion: @escaping (CityWeather?) -> Void) {
        weatherApi.getWeather(request: request) { cityWeather in
            completion(cityWeather)
        }
    }
    
    func tempInCelsius() -> String {
        return "\((cityWeather.main.temp * 1.8) + 32.0))"
    }
    
    func tempInFahrenheit() -> String {
        return "\(cityWeather.main.temp)"
    }
}
