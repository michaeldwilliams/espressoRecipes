//
//  AddBagViewController.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/11/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import UIKit
import RealmSwift

class AddBagViewController: UITableViewController {

    let bag = Bag()
    let realm = try! Realm()
    
    @IBOutlet weak var nametextField: UITextField!
    @IBOutlet weak var roasterTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var roastTextField: UITextField!
    @IBOutlet weak var tastingNotesTextView: UITextView!
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem){
        bag.name = nametextField.text ?? ""
        bag.roaster = roasterTextField.text ?? ""
        bag.weight = Int(weightTextField.text!) ?? 0
        bag.roast = roastTextField.text ?? ""
        bag.tastingNotes = tastingNotesTextView.text ?? ""

        
        try! self.realm.write {
            self.realm.add(self.bag)
        }
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }



}
