//
//  DetailRepositoryProtocol.swift
//  MovieDB
//
//  Created by Matias Alvin on 25/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

protocol DetailRepositoriesProtocol {
    func get(id: Int) throws -> Movie
}
