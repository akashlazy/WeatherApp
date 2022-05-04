//
//  JsonExtension.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/4/22.
//

import Foundation

struct JsonExtension {
    private let name: String
    init(fileName: String) {
        name = fileName
    }
    
    func getJson<T: Decodable>(_ resultType: T.Type, completion: @escaping (T?)-> Void) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        
        guard let jsonData = try? JSONDecoder().decode(resultType.self, from: data) else { return }
        completion(jsonData)
    }
}
