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
    
    @objc dynamic var bagId = UUID().uuidString
    
    @objc dynamic var roaster = ""
    @objc dynamic var name = ""
    @objc dynamic var weight = 0
    @objc dynamic var tastingNotes = ""
    @objc dynamic var roast = ""
    
    
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
