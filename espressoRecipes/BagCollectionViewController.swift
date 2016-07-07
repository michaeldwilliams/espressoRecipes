//
//  BagCollectionViewController.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/11/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework
import DZNEmptyDataSet

private let reuseIdentifier = "bagCell"

class BagCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {

    var bags:Results<Bag>!
    
    var realm:Realm!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
        
        self.bags = realm.objects(Bag)
        
        collectionView!.backgroundColor = .whiteColor()
        
        collectionView?.emptyDataSetSource = self
        collectionView?.emptyDataSetDelegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

 

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "showRecipesForBagSegue" {
            let destVC = segue.destinationViewController as! RecipeViewController
            let cell = sender as! BagCollectionViewCell
            let indexPath = collectionView?.indexPathForCell(cell)
            destVC.bagName = bags[(indexPath?.row)!].name
            destVC.bag = bags[(indexPath?.row)!]
            destVC.backgroundColor = cell.backgroundColor
        }
        
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return bags.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:BagCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BagCollectionViewCell
    
        // Configure the cell
        
        let bag = bags[indexPath.row]
        cell.nameLabel.text = bag.name
        cell.roasterLabel.text = bag.roaster
        cell.nameLabel.textColor = .whiteColor()
        cell.roasterLabel.textColor = .whiteColor()
        
        switch (indexPath.row % 6) {
        case 0:
            cell.backgroundColor = FlatRed()
            break;
        case 1:
            cell.backgroundColor = FlatBlue()
            break;
        case 2:
            cell.backgroundColor = FlatMintDark()
            break;
        case 3:
            cell.backgroundColor = FlatOrange()
            break;
        case 4:
            cell.backgroundColor = FlatMaroon()
            break;
        case 5:
            cell.backgroundColor = FlatGreen()
            break;
        case 6:
            cell.backgroundColor = FlatPurple()
            break;
        default:
            cell.backgroundColor = FlatCoffee()
        }
        
        
        cell.layer.masksToBounds = true;
        cell.layer.cornerRadius = 6;
    
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((UIScreen.mainScreen().bounds.width-17)/3,155)
    }

    
    //MARK: DZNEmptyDataSetDelegate and DataSource
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "\n\nWelcome"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleTitle3)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Add your coffee bags here by tapping the '+' at the top right"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "coffee")
    }

    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
