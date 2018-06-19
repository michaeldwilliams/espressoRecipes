//
//  Bag.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/11/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import Foundation

class Bag: NSObject, Codable {
    
    var bagId = UUID().uuidString
    var roaster = ""
    var dateRoasted:Date?
    var name = ""
    var weight = 0
    var tastingNotes = ""
    var roast = ""
    var recipes = [Recipe]()
}
