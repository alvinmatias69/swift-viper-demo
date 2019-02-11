//
//  DetailPresenter.swift
//  MovieDB
//
//  Created by Matias Alvin on 04/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    var interactor: DetailInteractorProtocol!
    var view: DetailViewProtocol!
    
    func showMovie(id: String) {
        let movie = interactor.getMovie(id: id)
        view.updateMovieDescription(movie: movie)
    }
    
    
}
