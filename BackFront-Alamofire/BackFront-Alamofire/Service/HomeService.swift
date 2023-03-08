//
//  HomeService.swift
//  BackFront-Alamofire
//
//  Created by Alessandro Comparini on 08/03/23.
//

import UIKit
import Alamofire

class HomeService {

    private let URL: String = "https://run.mocky.io/v3/85ade36b-22a0-4a0d-9833-5818a3225521"
    
    public func getAllDataJsonAlamofire(completion: @escaping (HomeData?, Error?) -> Void) {
        
        AF.request(self.URL, method: .get)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: HomeData.self) { response in
                switch response.result {
                case .success( let data):
                    completion(data,nil)
                case .failure( let error):
                    completion(nil, error)
                }
            }
        
    }
    
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
