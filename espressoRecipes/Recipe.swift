//
//  Recipe.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/10/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import Foundation
import RealmSwift

class Recipe: Object {
    
    dynamic var recipeId = NSUUID().UUIDString
    dynamic var bag : Bag?
    dynamic var dose = 0
    dynamic var yield = 0
    dynamic var time = ""
    dynamic var notes = ""
    dynamic var favorite = false
    
    convenience init(dose:Int, yield:Int, time:String) {
        self.init()
        self.dose = dose
        self.yield = yield
        self.time = time
    }
    
    override class func primaryKey() -> String? {
        return "recipeId"
    }
    
    
}
