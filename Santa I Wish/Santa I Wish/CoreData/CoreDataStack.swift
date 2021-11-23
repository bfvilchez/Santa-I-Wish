//
//  CoreDataStack.swift
//  Santa I Wish
//
//  Created by Brian Vilchez on 11/22/21.
//

import Foundation
import CoreData

class CoreDataStack: NSObject {
    
    static let shared = CoreDataStack()
    
    // Set up a persistent container
    lazy var container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "SantaIWishModel")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
        
        // Automatically merging changes from parent
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    // Create easy access to the moc (managed object context)
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    func save(context: NSManagedObjectContext) {
        context.performAndWait {
            do {
                try context.save()
            } catch {
                NSLog("Error saving context: \(error)")
                context.reset()
            }
        }
    }
    
    func saveToPersistentStore() {
        do {
            try mainContext.save()
        } catch {
            NSLog("Error saving context: \(error)")
            mainContext.reset()
        }
    }
}
