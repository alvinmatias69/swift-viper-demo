//
//  DetailInteractor.swift
//  MovieDB
//
//  Created by Matias Alvin on 03/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

class DetailInteractor: DetailInteractorProtocol {
    var repository: DetailRepositoriesProtocol!
    
    func getMovie(id: String) -> DetailResp {
        var response: DetailResp? = nil
        
        do {
            let movie = try repository.get(id: Int(id)!)
            let dateFormatter = DateFormatter()
            response = DetailResp(date: dateFormatter.string(from: movie.date), name: movie.name, rating: movie.rating, description: id)
        } catch {
            print("error: \(error)")
        }
        
        return response!
    }
}
