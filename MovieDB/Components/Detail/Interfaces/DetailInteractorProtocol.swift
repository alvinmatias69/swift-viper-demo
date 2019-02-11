//
//  DetailInteractorProtocol.swift
//  MovieDB
//
//  Created by Matias Alvin on 03/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

protocol DetailInteractorProtocol {
    func getMovie(id: String) -> DetailResp
}
