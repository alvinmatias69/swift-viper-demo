//
//  ListRouter.swift
//  MovieDB
//
//  Created by Matias Alvin on 28/01/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation
import UIKit

class ListRouter: ListRouterProtocol {
    static func assembleComponent() -> UIViewController {
        let presenter = ListPresenter()
        let interactor = ListGenerator()
        let repository = MovieRepository()
        
        let storyboard = UIStoryboard(name: "ListView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ListView") as! ListView
        
        interactor.repository = repository
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = ListRouter()
        presenter.showMovieList()
        
        
        viewController.presenter = presenter
        
        let navigation = UINavigationController(rootViewController: viewController)
        
        return navigation
    }
    
    func presentDetail(movie: ListResponse) {
        RootRouter.pushViewController(vc: DetailRouter.assembleModule())
        
    }
    
}
