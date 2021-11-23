//
//  Child+Representation.swift
//  Santa I Wish
//
//  Created by Brian Vilchez on 11/22/21.
//

import Foundation

struct ChildRepresentation: Codable {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
           self.name = name
           self.age = age
    }
    
    init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           
           let name = try container.decode(String.self, forKey: .name)
           let age = try container.decode(String.self, forKey: .age) as? Int ?? 0
        
           self.name = name
           self.age = age

       }

}
