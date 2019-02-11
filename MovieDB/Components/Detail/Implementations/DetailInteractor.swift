//
//  DetailInteractor.swift
//  MovieDB
//
//  Created by Matias Alvin on 03/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

class DetailInteractor: DetailInteractorProtocol {
    var repository: MovieRepositoryProtocol!
    
    func getMovie(id: String) -> DetailResp {
        let movie = repository.get(id: id)
        let dateFormatter = DateFormatter()
        return DetailResp(date: dateFormatter.string(from: movie.date), name: movie.name, rating: movie.rating, description: id)
    }
}
