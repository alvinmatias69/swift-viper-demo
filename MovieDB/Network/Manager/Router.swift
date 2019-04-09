//
//  Router.swift
//  MovieDB
//
//  Created by Matias Alvin on 25/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

class Router<EndPoint: EndPointType> {
    private var task: URLSessionTask?
    
    private func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod.rawValue
        
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters,
                                    let bodyEncoding,
                                    let urlParameters):
                
                request = try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             queryParameters: urlParameters,
                                             urlRequest: request)
                
            case .requestParametersAndHeaders(let bodyParameters,
                                              let bodyEncoding,
                                              let urlParameters,
                                              let additionalHeaders):
                
                request = self.addAdditionalHeaders(additionalHeaders, urlRequest: request)
                request = try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             queryParameters: urlParameters,
                                             urlRequest: request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    private func configureParameters(bodyParameters: Parameters?,
                                     bodyEncoding: ParameterEncoding,
                                     queryParameters: Parameters?,
                                     urlRequest: URLRequest) throws -> URLRequest {
        do {
            let urlRequest = try bodyEncoding.encode(urlRequest: urlRequest, bodyParams: bodyParameters, queryParams: queryParameters)
            return urlRequest
        } catch {
            throw error
        }
    }
    
    private func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, urlRequest: URLRequest) -> URLRequest {
        var urlRequest = urlRequest
        guard let headers = additionalHeaders else { return urlRequest }
        
        for (key, value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        return urlRequest
    }
}

extension Router: NetworkRouter {
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
        } catch {
            completion(nil,nil,error)
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
}
