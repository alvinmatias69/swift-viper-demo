//
//  MovieStorages.swift
//  MovieDB
//
//  Created by Matias Alvin on 08/04/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation
import CoreData

class MovieStorages: MainStorages {
    var persistentContainer: NSPersistentContainer!
    
    func onComplete(_ result: Result<Any, Error>) {
        switch result {
        case .success(_):
            print("success")
        default:
            print("failure")
        }
    }
    
    func save(movie: Movie) {
        let moc = persistentContainer.viewContext
        
        func process() {
            let movieStore = MovieStore(context: moc)
            movieStore.id = Int32(movie.id)
            movieStore.name = movie.name
            movieStore.rating = movie.rating
            movieStore.desc = movie.description
        }
        
        persistData(context: moc, process: process, onComplete: onComplete)
    }
    
    func get() -> [Movie] {
        let request: NSFetchRequest<MovieStore> = MovieStore.fetchRequest()
        
        let moc = persistentContainer.viewContext
        
        var movies: [Movie] = []
        
        guard let results = try? moc.fetch(request)
            else { return movies }
        
        for result in results {
            let movie: Movie = Movie(id: Int(result.id), date: Date.init(), name: result.name!, rating: result.rating, description: result.desc!)
            movies.append(movie)
        }
        
        return movies
    }
    
    func get(with name: String) -> [Movie] {
        let request: NSFetchRequest<MovieStore> = MovieStore.fetchRequest()
        request.predicate = NSPredicate(format: "name = %@", name)
        
        let moc = persistentContainer.viewContext
        
        var movies: [Movie] = []
        
        guard let results = try? moc.fetch(request)
            else { return movies }
        
        for result in results {
            let movie: Movie = Movie(id: Int(result.id), date: Date.init(), name: result.name!, rating: result.rating, description: result.desc!)
            movies.append(movie)
        }
        
        return movies
    }
    
    func update(with id: Int, movie: Movie) {
        let request: NSFetchRequest<MovieStore> = MovieStore.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", String(id))
        
        let moc = persistentContainer.viewContext
        
        guard let results = try? moc.fetch(request)
            else { return }
        
        if results.count > 0 {
            func process() {
                let movieStore = results[0]
                movieStore.name = movie.name
                movieStore.rating = movie.rating
                movieStore.desc = movie.description
            }
            
            persistData(context: moc, process: process, onComplete: onComplete)
        }
    }
    
    func delete(with id: Int) {
        let request: NSFetchRequest<MovieStore> = MovieStore.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", String(id))
        
        let moc = persistentContainer.viewContext
        
        guard let results = try? moc.fetch(request)
            else { return }
        
        if results.count > 0 {
            func process() {
                let movieStore = results[0]
                moc.delete(movieStore)
            }
                
            persistData(context: moc, process: process, onComplete: onComplete)
        }
    }
}
