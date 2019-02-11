//
//  ListViewProtocol.swift
//  MovieDB
//
//  Created by Matias Alvin on 28/01/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

protocol ListViewProtocol {
    func populateMovieList(movieList: Array<ListResponse>)
}
