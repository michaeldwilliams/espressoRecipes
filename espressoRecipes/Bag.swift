//
//  Bag.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/11/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import Foundation
import RealmSwift

class Bag: Object {
    
    dynamic var bagId = UUID().uuidString
    
    dynamic var roaster = ""
    dynamic var name = ""
    dynamic var weight = 0
    dynamic var tastingNotes = ""
    dynamic var roast = ""
    
    
    convenience init(roaster:String, name:String, weight:Int) {
        self.init()
        self.roaster = roaster
        self.name = name
        self.weight = weight
    }
    
    override class func primaryKey() -> String? {
        return "bagId"
    }
    
    
}
