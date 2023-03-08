//
//  HomeService.swift
//  BackFront-Alamofire
//
//  Created by Alessandro Comparini on 08/03/23.
//

import UIKit

class HomeService {

    public func getAllDataJsonFile(completion: @escaping (HomeData?, Error?) -> Void) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                let homeData: HomeData = try JSONDecoder().decode(HomeData.self, from: data)
                completion(homeData, nil)
            } catch  {
                completion(nil, error)
            }
            
        }
    }
    
}
