//
//  ListRepositoriesProtocol.swift
//  MovieDB
//
//  Created by Matias Alvin on 24/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

protocol ListRepositoryProtocol {
    func getList() throws -> Array<Movie>
}
