//
//  ParameterEncoderProtocol.swift
//  MovieDB
//
//  Created by Matias Alvin on 25/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

typealias  Parameters = [String:Any]

protocol ParameterEncoderProtocol {
    static func encode(urlRequest: URLRequest, with parameters: Parameters) throws -> URLRequest
}
