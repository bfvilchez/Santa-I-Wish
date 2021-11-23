//
//  Parent+Convenience.swift
//  Santa I Wish
//
//  Created by Brian Vilchez on 11/22/21.
//

import Foundation
import CoreData


extension Parent {
    
    convenience init(name: String, email:String, password: String, children: NSSet = [], context: NSManagedObjectContext) {
        self.init(context:context)
        self.name = name
        self.email = email
        self.children = children
        self.password = password
    }
}
