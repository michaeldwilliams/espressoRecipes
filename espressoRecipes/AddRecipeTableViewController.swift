//
//  AddRecipeTableViewController.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/12/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import UIKit
import RealmSwift

class AddRecipeTableViewController: UITableViewController {

    let recipe = Recipe()
    let realm = try! Realm()
    var bag : Bag?
    
    @IBAction func cancelBarButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveBarButtonTapped(_ sender: UIBarButtonItem) {
        recipe.bag = bag
        recipe.dose = Int(doseTextField.text!)!
        recipe.yield = Int(yieldTextField.text!)!
        recipe.time = timeTextField.text!
        recipe.notes = notesTextView.text
        try! realm.write {
            realm.add(recipe)
        }
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var doseTextField: UITextField!
    @IBOutlet weak var yieldTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
