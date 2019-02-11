//
//  RootRouter.swift
//  MovieDB
//
//  Created by Matias Alvin on 02/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import UIKit

class RootRouter {
    static var rootViewController: UIViewController!;
    
    static func presentMovieListScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        let viewController = ListRouter.assembleComponent()
        window.rootViewController = viewController
        rootViewController = viewController
    }
    
    static func pushViewController(vc: UIViewController) {
        rootViewController.navigationController?.pushViewController(vc, animated: true)
    }
}
