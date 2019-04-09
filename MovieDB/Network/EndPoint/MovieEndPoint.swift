//
//  MovieEndPoint.swift
//  MovieDB
//
//  Created by Matias Alvin on 25/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

enum MovieApi {
    case topRated
    case detail(id:Int)
}

extension MovieApi: EndPointType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3") else { fatalError("baseURL could not be configured") }
        return url
    }
    
    var path: String {
        switch self {
        case .topRated:
            return "/movie/top_rated"
        case .detail(let id):
            return "/movie/\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .topRated:
            return .get
        case .detail(_):
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .topRated:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api_key":RootManager.MovieAPIKey])
        case .detail(_):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api_key":RootManager.MovieAPIKey])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
