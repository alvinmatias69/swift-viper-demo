//
//  Implementation.swift
//  MovieDB
//
//  Created by Matias Alvin on 28/01/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

class MovieRepository {
    let movieNetwork = MovieNetworkManager()
}

extension MovieRepository: ListRepositoryProtocol {
    func getList() throws -> Array<Movie> {
        var result: Array<Movie> = []
        let semaphore = DispatchSemaphore(value: 0)
        
        movieNetwork.getMovieList() { movies, error in
            if let error = error {
                print("error: \(error)")
                return
            }
            result = movies!
            semaphore.signal()
        }
        
        semaphore.wait()
        return result
    }
    
}

extension MovieRepository: DetailRepositoriesProtocol {
    func get(id: Int) throws -> Movie {
        var result: Movie? = nil
        let semaphore = DispatchSemaphore(value: 0)
        
        movieNetwork.getMovieDetail(id: id) { movie, error in
            if let error = error {
                print("error: \(error)")
                return
            }
            result = movie
            semaphore.signal()
        }
        
        semaphore.wait()
        return result!
    }
}
