//
//  RootRouter.swift
//  MovieDB
//
//  Created by Matias Alvin on 02/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import UIKit

class RootRouter {
    static var window: UIWindow!
    
    static func presentMovieListScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        let viewController = ListRouter.assembleComponent()
        window.rootViewController = viewController
        self.window = window
    }
    
    static func resetScreen(screen: UIViewController) {
        window.rootViewController = screen
    }
}
