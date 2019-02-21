//
//  DetailRouter.swift
//  MovieDB
//
//  Created by Matias Alvin on 04/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation
import UIKit

class DetailRouter: DetailRouterProtocol {
    static func assembleModule() -> UIViewController {
        let repository = MovieRepository()
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailView") as! DetailView
        
        interactor.repository = repository
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        viewController.presenter = presenter
        
        return viewController
    }
    
    func navigateToList() {
        let listView = ListRouter.assembleComponent()
        RootRouter.resetScreen(screen: listView)
    }
}
