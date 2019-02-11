//
//  Implementation.swift
//  MovieDB
//
//  Created by Matias Alvin on 28/01/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

class MovieRepository: MovieRepositoryProtocol {
    func getList() -> Array<Movie> {
        let movieList = [
            Movie(date: Date(), name: "test name", rating: 4, description: "This is a test movie"),
            Movie(date: Date(), name: "test 2", rating: 3, description: "This is a test movie"),
            Movie(date: Date(), name: "test 3", rating: 3, description: "This is a test movie"),
        ]
        return movieList
    }
    
    func get(id: String) -> Movie {
        return Movie(date: Date.init(), name: "test name", rating: 4, description: "This is a test movie")
    }
    
    
}
