//
//  WeatherRepository.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import Foundation

protocol WeatherRepository {
    
    func getWeather(request: LocationWeatherRequest, completionHandler: @escaping (_ result: CityWeather?) -> Void)
}
