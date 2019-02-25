//
//  MovieNetworkManager.swift
//  MovieDB
//
//  Created by Matias Alvin on 25/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

class MovieNetworkManager : RootManager {
    let router = Router<MovieApi>()
    
    func getMovieList(completion: @escaping (_ movie: Array<Movie>?, _ error: String?) -> ()) {
        router.request(.topRated) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let data = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let movies = try self.parseList(data)
                        completion(movies, nil)
                    }catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func getMovieDetail(id: Int, completion: @escaping (_ movie: Movie?, _ error: String?) -> ()) {
        router.request(.detail(id: id)) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let data = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let movie = try self.parse(data)
                        completion(movie, nil)
                    }catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
}

extension MovieNetworkManager {
    private func parseList(_ data: Data) throws -> Array<Movie> {
        var movieList: Array<Movie> = []
        var response: [String: Any]
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [:]
        } catch {
            throw error
        }
        
        guard let result = response["results"] as? [Any] else {
            throw NetworkError.encodingFailed
        }
        
        for movie in result {
            if let movie = movie as? [String:Any],
                let name = movie["title"] as? String,
                let rating = (movie["vote_average"] as? NSNumber)?.floatValue,
                let description = movie["overview"] as? String,
                let id = (movie["id"] as? NSNumber)?.intValue {
                movieList.append(Movie(id: id, date: Date(), name: name, rating: rating, description: description))
            }
        }
        
        return movieList
    }
    
    private func parse(_ data: Data) throws -> Movie {
        var response: [String: Any]
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [:]
        } catch {
            throw error
        }
        
        if let name = response["title"] as? String,
            let rating = (response["vote_average"] as? NSNumber)?.floatValue,
            let description = response["overview"] as? String,
            let id = (response["id"] as? NSNumber)?.intValue {
            let movie = Movie(id: id, date: Date(), name: name, rating: rating, description: description)
            return movie
        } else {
            throw NetworkError.encodingFailed
        }
    }
}
