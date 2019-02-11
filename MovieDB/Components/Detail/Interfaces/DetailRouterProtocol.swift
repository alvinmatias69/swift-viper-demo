//
//  DetailRouterProtocol.swift
//  MovieDB
//
//  Created by Matias Alvin on 04/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation
import UIKit

protocol DetailRouterProtocol {
    static func assembleModule() -> UIViewController
    func navigateToList()
}
