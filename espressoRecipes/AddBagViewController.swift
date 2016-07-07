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
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func saveButtonTapped(sender: UIBarButtonItem){
        bag.name = nametextField.text!
        bag.roaster = roasterTextField.text!
        bag.weight = Int(weightTextField.text!)!
        if let roast = roastTextField.text {
            bag.roast = roast
        } else {
            bag.roast = ""
        }
        bag.tastingNotes = tastingNotesTextView.text

        
        try! self.realm.write {
            self.realm.add(self.bag)
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
