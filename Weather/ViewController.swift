//
//  ViewController.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    private let weatherVM = WeatherViewModel()
    private var cityWeather: CityWeather?
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        let json = JsonExtension(fileName: "Weather")
        //        json.getJson(CityWeather.self) { cityWeather in
        //            self.cityWeather = cityWeather
        //            debugPrint(cityWeather)
        //        }
        
        setUpLocation()
    }
    
    private func setUpLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestLocation()
    }
    
    private func getLocation(_ lat: Double, lon: Double) {
        weatherVM.getWeather(LocationWeatherRequest(lat: "\(lat)", lon: "\(lon)", city: "")) { cityWeather in
            self.cityWeather = cityWeather
            debugPrint(cityWeather)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            print(location.latitude)
            print(location.longitude)
            getLocation(location.latitude, lon: location.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        debugPrint(error.localizedDescription)
    }
}
