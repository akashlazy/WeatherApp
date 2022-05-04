//
//  ViewController.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import UIKit

class ViewController: UIViewController {

    private let weatherVM = WeatherViewModel()
    private var cityWeather: CityWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        weatherVM.getWeather(LocationWeatherRequest(lat: "20.7453", lon: "78.6022", city: "")) { cityWeather in
//            debugPrint(cityWeather?.name)
//        }
        
        let json = JsonExtension(fileName: "Weather")
        json.getJson(CityWeather.self) { cityWeather in
            self.cityWeather = cityWeather
            debugPrint(cityWeather)
        }
    }
}

