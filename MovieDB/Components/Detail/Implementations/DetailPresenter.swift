//
//  DetailPresenter.swift
//  MovieDB
//
//  Created by Matias Alvin on 04/02/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {
    var interactor: DetailInteractorProtocol!
    var view: DetailViewProtocol!
    var router: DetailRouterProtocol!
    
    func showMovie(id: String) {
        let dispatchQueue = DispatchQueue(label: "get movie detail", qos: .background)
        
        dispatchQueue.async {
            let movie = self.interactor.getMovie(id: id)
            self.view.updateMovieDescription(movie: movie)
        }
    }
    
    func resetToList() {
        router.navigateToList()
    }
}
