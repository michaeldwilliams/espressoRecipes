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
    override func viewWillAppear(animated: Bool) {
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
        self.recipeTableView.backgroundColor = UIColor.flatWhiteColor()
        self.recipeTopView.backgroundColor = backgroundColor
        self.recipeTableView.emptyDataSetSource = self
        self.recipeTableView.emptyDataSetDelegate = self
        
        self.recipeTableView.delegate = self
        self.recipeTableView.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return recipes.count
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipeCell", forIndexPath: indexPath) as! RecipeTableViewCell
        
        let recipe = recipes[indexPath.section]
        cell.recipeLabel?.text = "Dose: \(recipe.dose)g | Yield: \(recipe.yield)g | Time: \(recipe.time) sec"
        cell.notesLabel?.text = recipe.notes
        cell.configureWithRecipe(recipe)        
        
        return cell
    }
    
    //MARK: DZNEmptyDataSetDelegate and DataSource
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "\n\nWelcome"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleTitle3)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Add your coffee recipies here by tapping the '+' at the top right"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "coffee")
    }

    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
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