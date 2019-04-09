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
    var viewController: UIViewController!
    
    static func assembleComponent() -> UIViewController {
        let presenter = ListPresenter()
        let interactor = ListGenerator()
        let repository = MovieRepository()
        let router = ListRouter()
        
        let storyboard = UIStoryboard(name: "ListView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ListView") as! ListView
        
        interactor.repository = repository
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        presenter.showMovieList()
        
        
        viewController.presenter = presenter
        
        let navigation = UINavigationController(rootViewController: viewController)
        router.viewController = navigation
        
        return navigation
    }
    
    func presentDetail(movie: ListResponse) {
        let detailRouter = DetailRouter.assembleModule(id: String(movie.id))
//        viewController.present(detailRouter, animated: true, completion: nil)
        viewController.show(detailRouter, sender: self)
    }
    
}
