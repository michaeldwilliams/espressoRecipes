//
//  RecipeTableViewController.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/11/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import UIKit
import RealmSwift

class RecipeTableViewController: UITableViewController {

    var recipes:Results<Recipe>!
    var bagName = ""
    var bag : Bag?
    
    @IBOutlet weak var tableFooterView: UIView!
    @IBOutlet weak var bagNameNavigationItem: UINavigationItem!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let predicate = NSPredicate(format: "bag = %@", argumentArray: [bag!])
        recipes = realm.objects(Recipe.self).filter(predicate)
        
        bagNameNavigationItem.title = bagName
        
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = UIColor.flatWhiteColor()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return recipes.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipeCell", forIndexPath: indexPath) as! RecipeTableViewCell

        let recipe = recipes[indexPath.section]
        cell.recipeLabel?.text = "Dose: \(recipe.dose) | Yield: \(recipe.yield) | Time: \(recipe.time)"
        cell.notesLabel?.text = recipe.notes
        cell.configureWithRecipe(recipe)
//        cell.favoriteStarImageView.image = UIImage(named: "star")
        
        
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addRecipesForBagSegue" {
            let navVC = segue.destinationViewController as! UINavigationController
            let destVC = navVC.viewControllers.first as! AddRecipeTableViewController
            destVC.bag = bag
        }

        
    }
    

}
