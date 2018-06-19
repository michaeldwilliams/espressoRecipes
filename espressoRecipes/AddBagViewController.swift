//
//  AddBagViewController.swift
//  espressoRecipes
//
//  Created by Michael Williams on 6/11/16.
//  Copyright © 2016 Michael D. Williams. All rights reserved.
//

import UIKit

class AddBagViewController: UITableViewController {

    let bag = Bag()
    let placeholderTextArray = ["Roaster", "Name", "Roast Date", "Weight", "Roast", "Tasting Notes"]
    var placeholderText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem){
        

        dismiss(animated: true, completion: nil)
    }
}

extension AddBagViewController {
    //MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeholderTextArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AddBagTableViewCell else {
            preconditionFailure("Could not cast cell to AddBagTableViewCell")
        }
        cell.addBagTextEntryTextView.delegate = self
        cell.addBagTextEntryTextView.text = placeholderTextArray[indexPath.row]
        cell.addBagTextEntryTextView.textColor = .lightGray

        return cell
    }
}

extension AddBagViewController: UITextViewDelegate {
    //MARK: UITextViewDelegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.tableView.beginUpdates()
        textView.frame = CGRect(x: textView.frame.minX, y: textView.frame.minY, width: textView.frame.width, height: textView.contentSize.height + 40)
        self.tableView.endUpdates()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let cell = textView.superview?.superview as? AddBagTableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        if textView.text.isEmpty {
            textView.text = placeholderTextArray[indexPath.row]
            textView.textColor = .lightGray
        }
    }
}


