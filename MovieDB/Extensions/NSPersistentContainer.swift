//
//  NSPersistentContainer.swift
//  MovieDB
//
//  Created by Matias Alvin on 08/04/19.
//  Copyright © 2019 Matias Alvin. All rights reserved.
//

import CoreData

extension NSPersistentContainer {
    func saveContextIfNeeded() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
