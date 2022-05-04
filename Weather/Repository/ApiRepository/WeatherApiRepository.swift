//
//  WeatherApiRepository.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import Foundation

struct WeatherApiRepository: WeatherRepository {

    private let httpUtility: HttpUtility = HttpUtility.shared
    
    func getWeather(request: LocationWeatherRequest, completionHandler: @escaping (CityWeather?) -> Void) {
        
        let requestUrl = URL(string: ApiEndpoints.weather + "?" + "lat=\(request.lat)&lon=\(request.lon)&appid=\(ApiEndpoints.apiKey)")
        
        let request = HURequest(withUrl: requestUrl!, forHttpMethod: .get)
        
        httpUtility.request(huRequest: request, resultType: CityWeather.self) { responce in
            switch responce {
            case .success(let cityWeather):
                completionHandler(cityWeather)
                break
            case .failure(let error):
                debugPrint(error)
                completionHandler(nil)
                break
            }
        }
    }
}
