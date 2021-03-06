//
//  DetailViewProtocol.swift
//  MovieDB
//
//  Created by Matias Alvin on 02/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

protocol DetailViewProtocol {
    func updateMovieDescription(movie: DetailResp)
    func resetToList()
}
