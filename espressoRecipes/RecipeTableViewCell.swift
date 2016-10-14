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
   
    @IBAction func favoriteStarButtonTapped(_ sender: UIButton) {
        updateFavorite(!favoritedButton.isSelected)
    }
    
    fileprivate func updateFavorite(_ selected:Bool) {
        if let realm = try? Realm(),
            let id  = self.recipeId,
            let recipe = realm.object(ofType: Recipe.self, forPrimaryKey:id as AnyObject) {
            
            try! realm.write {
                recipe.favorite = selected
            }
            
            favoritedButton.isSelected = recipe.favorite
            print(recipe.favorite)
        }
    
    }
    
    func configureWithRecipe(_ recipe: Recipe) {
        recipeId = recipe.recipeId
        favoritedButton.isSelected = recipe.favorite
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
