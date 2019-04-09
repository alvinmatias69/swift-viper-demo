//
//  ParameterEncoding.swift
//  MovieDB
//
//  Created by Matias Alvin on 25/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

enum ParameterEncoding {
    case urlEncoding
    case jsonEncoding
    case urlAndJsonEncoding
    
    func encode(urlRequest: URLRequest,
                bodyParams: Parameters?,
                queryParams: Parameters?) throws -> URLRequest {
        do {
            var urlRequest = urlRequest
            
            switch self {
            case .urlEncoding:
                guard let queryParams = queryParams else { return urlRequest }
                urlRequest = try URLParameterEncoder.encode(urlRequest: urlRequest, with: queryParams)
                
            case .jsonEncoding:
                guard let bodyParams = bodyParams else { return urlRequest }
                urlRequest = try JSONParameterEncoder.encode(urlRequest: urlRequest, with: bodyParams)
                
            case .urlAndJsonEncoding:
                guard let queryParams = queryParams,
                    let bodyParams = bodyParams else { return urlRequest }
                urlRequest = try URLParameterEncoder.encode(urlRequest: urlRequest, with: queryParams)
                urlRequest = try JSONParameterEncoder.encode(urlRequest: urlRequest, with: bodyParams)
            }
            
            return urlRequest
        } catch {
            throw error
        }
    }
}

public enum NetworkError : String, Error {
    case parameterNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
