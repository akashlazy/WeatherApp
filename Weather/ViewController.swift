//
//  ViewController.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    private let weatherVM = WeatherViewModel()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        weatherVM.loadWeather { [weak self] success in
//            self?.displayUI()
//        }
        
        setUpLocation()
        displayUI()
    }
    
    private func setUpLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestLocation()
    }
    
    private func displayUI() {
        changeTemperature()
        city.text = weatherVM.cityName()
        condition.text = weatherVM.condition()
        weatherImage.load(weatherVM.icon())
    }
    
    private func changeTemperature() {
        temperature.text = weatherVM.mainTemp()
        highTemp.text = "H:" + weatherVM.maxTemp()
        lowTemp.text = "L:" + weatherVM.minTemp()
    }
    
    @IBAction func toggleButton(_ sender: UIButton) {
        UserDefaults.temperatureUnit.toggle()
        sender.setTitle(UserDefaults.temperatureUnit ? "Celsius" : "Fahrenheit", for: .normal)
        sender.titleLabel?.font = .systemFont(ofSize: 30)
        changeTemperature()
    }
    
    private func getLocation(_ lat: Double, lon: Double) {
        weatherVM.getWeather(LocationWeatherRequest(lat: "\(lat)", lon: "\(lon)", city: "")) { success in
            if success {
                DispatchQueue.main.async {
                    self.displayUI()
                }
            }
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
