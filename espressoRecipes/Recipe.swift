//
//  Recipe.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/10/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import Foundation

class Recipe: NSObject, Codable {
    
    var recipeId = UUID().uuidString
    var dateCreated = Date().dateString
    var bag : Bag?
    var dose: Float = 0.0
    var yield: Float = 0.0
    var time: Int = 0
    var notes = ""
    var favorite = false
    
}
