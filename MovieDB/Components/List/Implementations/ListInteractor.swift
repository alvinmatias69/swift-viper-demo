//
//  Interactor.swift
//  MovieDB
//
//  Created by Matias Alvin on 27/01/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

class ListGenerator: ListRequesterProtocol {
    var repository: ListRepositoryProtocol!
    
    func get() -> Array<ListResponse> {
        var movies: Array<ListResponse> = []
        if let repositoryMovies = try? repository.getList() {
            movies = repositoryMovies.map { (movie) -> ListResponse in
                let dateFormatter = DateFormatter()
                return ListResponse(id: movie.id, date: dateFormatter.string(from: movie.date), name: movie.name, rating: movie.rating, description: movie.description)
            }
        }
        return movies
    }
}
