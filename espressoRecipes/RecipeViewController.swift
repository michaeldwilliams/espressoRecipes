//
//  RecipeViewController.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/12/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import UIKit
import RealmSwift
import DZNEmptyDataSet

class RecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {

    var recipes:Results<Recipe>!
    var bagName = ""
    var bag : Bag?
    var backgroundColor : UIColor?
    
    @IBOutlet weak var recipeTopView: UIView!
    @IBOutlet weak var recipeTableView: UITableView!
    @IBOutlet weak var tableFooterView: UIView!
    @IBOutlet weak var bagNameNavigationItem: UINavigationItem!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roasterLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var roastLabel: UILabel!
    @IBOutlet weak var tastingNotesLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.recipeTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let predicate = NSPredicate(format: "bag = %@", argumentArray: [bag!])
        recipes = realm.objects(Recipe.self).filter(predicate)
        
        bagNameNavigationItem.title = "Recipes"
        
        nameLabel.text = bag?.name
        roasterLabel.text = bag?.roaster
        weightLabel.text = "\((bag?.weight)!)oz"
        roastLabel.text = bag?.roast
        tastingNotesLabel.text = bag?.tastingNotes
        
        self.recipeTableView.estimatedRowHeight = 50
        self.recipeTableView.rowHeight = UITableViewAutomaticDimension
        self.recipeTableView.tableFooterView = UIView()
        self.recipeTableView.backgroundColor = UIColor.flatWhite
        self.recipeTopView.backgroundColor = backgroundColor
        self.recipeTableView.emptyDataSetSource = self
        self.recipeTableView.emptyDataSetDelegate = self
        
        self.recipeTableView.delegate = self
        self.recipeTableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return recipes.count
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeTableViewCell
        
        let recipe = recipes[indexPath.section]
        cell.recipeLabel?.text = "Dose: \(recipe.dose)g | Yield: \(recipe.yield)g | Time: \(recipe.time) sec"
        cell.notesLabel?.text = recipe.notes
        cell.configureWithRecipe(recipe)        
        
        return cell
    }
    
    //MARK: DZNEmptyDataSetDelegate and DataSource
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "\n\nWelcome"
        let attrs = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.title3)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Add your coffee recipies here by tapping the '+' at the top right"
        let attrs = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "coffee")
    }

    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addRecipesForBagSegue" {
            let navVC = segue.destination as! UINavigationController
            let destVC = navVC.viewControllers.first as! AddRecipeTableViewController
            destVC.bag = bag
        }
        
        
    }

}
