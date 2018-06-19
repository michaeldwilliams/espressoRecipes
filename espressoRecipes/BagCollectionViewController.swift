//
//  BagCollectionViewController.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/11/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import UIKit
import ChameleonFramework
import DZNEmptyDataSet

private let reuseIdentifier = "bagCell"

class BagCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {

    var bagStore: BagStore!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundColor = .white
        collectionView?.emptyDataSetSource = self
        collectionView?.emptyDataSetDelegate = self

    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipesForBagSegue" {
            let destVC = segue.destination as! RecipeViewController
            let cell = sender as! BagCollectionViewCell
            let indexPath = collectionView?.indexPath(for: cell)
            destVC.bagName = bagStore.allBags[(indexPath?.row)!].name
            destVC.bag = bagStore.allBags[(indexPath?.row)!]
            destVC.backgroundColor = cell.backgroundColor
        }
        
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bagStore.allBags.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:BagCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BagCollectionViewCell
        
        let bag = bagStore.allBags[indexPath.row]
        cell.nameLabel.text = bag.name
        cell.roasterLabel.text = bag.roaster
        cell.nameLabel.textColor = .white
        cell.roasterLabel.textColor = .white
        
        switch ((indexPath as NSIndexPath).row % 6) {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width-17)/3,height: 155)
    }

    
    //MARK: DZNEmptyDataSetDelegate and DataSource
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "\n\nWelcome"
        let attrs = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.title3)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Add your coffee bags here by tapping the '+' at the top right"
        let attrs = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "coffee")
    }

    

}
