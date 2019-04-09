//
//  Presenter.swift
//  MovieDB
//
//  Created by Matias Alvin on 27/01/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation

class ListPresenter: ListPresenterProtocol {
    var interactor: ListRequesterProtocol!
    var view: ListViewProtocol!
    var router: ListRouterProtocol!
    
    func showMovieList() {
        let dispatchQueue = DispatchQueue(label: "get movie", qos: .background)
        dispatchQueue.async {
            let movieList = self.interactor.get()
            DispatchQueue.main.async {
                self.view.populateMovieList(movieList: movieList)
            }
        }
    }
    
    func selectMovie(movie: ListResponse) {
        router.presentDetail(movie: movie)
    }
}
