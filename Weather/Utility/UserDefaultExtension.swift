//
//  UserDefaultExtension.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import Foundation

extension UserDefaults {

    /// first launch flag
    static var temperatureUnit: Bool {
        get {
            return standard.bool(forKey: "temperatureUnit")
        }
        set {
            standard.set(newValue, forKey: "temperatureUnit")
            standard.synchronize()
        }
    }
}
