//
//  RecipeTableViewCell.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/11/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var favoritedButton: UIButton!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    var recipeId : String?
    let recipe = Recipe()
   
    @IBAction func favoriteStarButtonTapped(_ sender: UIButton) {
        updateFavorite(!favoritedButton.isSelected)
    }
    
    fileprivate func updateFavorite(_ selected:Bool) {
        recipe.favorite = selected
        favoritedButton.isSelected = recipe.favorite
    }
    
    func configureWithRecipe(_ recipe: Recipe) {
        recipeId = recipe.recipeId
        favoritedButton.isSelected = recipe.favorite
    }

}
