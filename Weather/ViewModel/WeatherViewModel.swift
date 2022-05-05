//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import Foundation

class WeatherViewModel {
    
    private let weatherApi = WeatherApiRepository()
    private var cityWeather: CityWeather? = nil
    
    func getWeather(_ request: LocationWeatherRequest, completionSucess: @escaping (Bool) -> Void) {
        weatherApi.getWeather(request: request) { cityWeather in
            if let _ = cityWeather {
                self.cityWeather = cityWeather
                completionSucess(true)
            } else {
                completionSucess(false)
            }
        }
    }
    
    func loadWeather(completion: @escaping (Bool) -> Void) {
        let json = JsonExtension(fileName: "Weather")
        json.getJson(CityWeather.self) { cityWeather in
            self.cityWeather = cityWeather
            completion(true)
        }
    }
    
    private func conversion(_ temp: Double) -> String {
        if UserDefaults.temperatureUnit {
            return String(format: "%.0f°",((temp - 273.15) * 1.8) + 32.0)
        }
        return String(format: "%.0f°", temp - 273.15)
    }
    
    func cityName() -> String {
        if let cityWeather = cityWeather {
            return cityWeather.name
        }
        return "-"
    }
    
    func condition() -> String {
        if let cityWeather = cityWeather {
            return cityWeather.weather[0].main
        }
        return "-"
    }
    
    func icon() -> String? {
        if let cityWeather = cityWeather {
            return cityWeather.weather[0].icon
        }
        return nil
    }
    
    func mainTemp() -> String {
        if let cityWeather = cityWeather {
            return conversion(cityWeather.main.temp)
        }
        return "-"
    }
    
    func minTemp() -> String {
        if let cityWeather = cityWeather {
            return conversion(cityWeather.main.tempMin)
        }
        return "-"
    }
    
    func maxTemp() -> String {
        if let cityWeather = cityWeather {
            return conversion(cityWeather.main.tempMax)
        }
        return "-"
    }
}
