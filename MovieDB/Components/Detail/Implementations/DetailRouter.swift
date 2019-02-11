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
        
        interactor.repository = repository
        presenter.interactor = interactor
        
        let storyboard = UIStoryboard(name: "DetailView", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailView") as! DetailView
        
        presenter.view = viewController
        return viewController
    }
    
    func navigateToList() {
        
    }
    
    
}
