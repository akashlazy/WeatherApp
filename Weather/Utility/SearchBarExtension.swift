//
//  SearchBarExtension.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/5/22.
//

import UIKit

extension UISearchBar {
    
    var textColor:UIColor? {
        get {
            if let textField = self.value(forKey: "searchField") as?
                UITextField  {
                return textField.textColor
            } else {
                return nil
            }
        }
        set (newValue) {
            if let textField = self.value(forKey: "searchField") as?
                UITextField  {
                textField.textColor = newValue
            }
        }
    }
}
