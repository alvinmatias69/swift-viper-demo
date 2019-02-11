//
//  Presenter.swift
//  MovieDB
//
//  Created by Matias Alvin on 27/01/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

protocol ListPresenterProtocol {
    func showMovieList()
    func selectMovie(movie: ListResponse)
}
