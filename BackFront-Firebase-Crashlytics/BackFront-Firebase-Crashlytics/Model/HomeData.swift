//
//  HomeData.swift
//  BackFront-Alamofire
//
//  Created by Alessandro Comparini on 08/03/23.
//

import Foundation

struct HomeData: Codable {
    let stories: [Story]?
    let posts: [Post]?
}
