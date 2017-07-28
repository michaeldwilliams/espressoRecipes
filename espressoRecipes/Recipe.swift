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
    
    @objc dynamic var recipeId = UUID().uuidString
    @objc dynamic var bag : Bag?
    @objc dynamic var dose = 0
    @objc dynamic var yield = 0
    @objc dynamic var time = ""
    @objc dynamic var notes = ""
    @objc dynamic var favorite = false
    
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
