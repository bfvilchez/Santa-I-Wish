//
//  Child+Convenience.swift
//  Santa I Wish
//
//  Created by Brian Vilchez on 11/22/21.
//

import Foundation
import CoreData

extension Child {
    
    var childRepresentation: ChildRepresentation? {
        guard let name = name else { return nil }

        return ChildRepresentation(name: name, age: Int(age))
    }
    
    convenience init(name: String, age: Int64, context: NSManagedObjectContext) {
        self.init(context:context)
        self.name = name
        self.age = age
    }
}
