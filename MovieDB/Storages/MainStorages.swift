//
//  MainStorages.swift
//  MovieDB
//
//  Created by Matias Alvin on 09/04/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import Foundation
import CoreData

class MainStorages {
    func persistData(context: NSManagedObjectContext, process: @escaping () -> Void, onComplete: @escaping (_ result: Result<Any, Error>) -> Void){
        context.perform {
            process()
            
            do {
                try context.save()
                onComplete(.success(true))
            } catch {
                context.rollback()
                onComplete(.failure(error))
            }
        }
    }
}
