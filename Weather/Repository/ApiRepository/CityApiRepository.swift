//
//  CityApiRepository.swift
//  Weather
//
//  Created by Akash Arun Jambhulkar (Digital) on 5/5/22.
//

import Foundation

struct CityApiRepository: CityRepository {
    
    private let httpUtility: HttpUtility = HttpUtility.shared
    
    func getCity(text: String, completionHandler: @escaping ([CityName]?) -> Void) {
        let limit = 5
        let requestUrl = URL(string: ApiEndpoints.baseCityURL + "?" + "q=\(text)&limit=\(limit)&appid=\(ApiEndpoints.apiKey)")
        
        let request = HURequest(withUrl: requestUrl!, forHttpMethod: .get)
        
        httpUtility.request(huRequest: request, resultType: [CityName].self) { responce in
            switch responce {
            case .success(let city):
                completionHandler(city)
                break
            case .failure(let error):
                debugPrint(error)
                completionHandler(nil)
                break
            }
        }
    }
}
