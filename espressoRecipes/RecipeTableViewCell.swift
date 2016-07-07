//
//  RecipeTableViewCell.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/11/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import UIKit
import RealmSwift

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var favoritedButton: UIButton!
    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    var recipeId : String?
   
    @IBAction func favoriteStarButtonTapped(sender: UIButton) {
        updateFavorite(!favoritedButton.selected)
    }
    
    private func updateFavorite(selected:Bool) {
        if let realm = try? Realm(),
            let id  = self.recipeId,
            let recipe = realm.objectForPrimaryKey(Recipe.self, key:id) {
            
            try! realm.write {
                recipe.favorite = selected
            }
            
            favoritedButton.selected = recipe.favorite
            print(recipe.favorite)
        }
    
    }
    
    func configureWithRecipe(recipe: Recipe) {
        recipeId = recipe.recipeId
        favoritedButton.selected = recipe.favorite
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
