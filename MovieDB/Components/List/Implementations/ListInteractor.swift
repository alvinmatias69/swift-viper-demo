//
//  Interactor.swift
//  MovieDB
//
//  Created by Matias Alvin on 27/01/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

class ListGenerator: ListRequesterProtocol {
    var repository: MovieRepositoryProtocol!
    
    func get() -> Array<ListResponse> {
        let movies: Array<ListResponse> = repository.getList().map { (movie) -> ListResponse in
            let dateFormatter = DateFormatter()
            return ListResponse(date: dateFormatter.string(from: movie.date), name: movie.name, rating: movie.rating, description: movie.description)
        }
        return movies
    }
}
