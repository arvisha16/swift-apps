//
//  CodeTermTableViewController.swift
//  Code Dictionary
//
//  Created by Aryan on 6/29/20.
//  Copyright © 2020 Aryan. All rights reserved.
//

import UIKit

class CodeTermTableViewController: UITableViewController {

    var terms: [Term] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // "Boolean", "Int", "Double", "String", "Array"
        
        let term1 = Term()
        term1.name = "Boolean"
        term1.definition = "A True or False Situation"
        term1.isType = true
        term1.color = "red"
        terms.append(term1)
        
        let term2 = Term()
        term2.name = "Double"
        term2.definition = "A Number with Decimals"
        term2.isType = true
        term2.color = "orange"
        terms.append(term2)

        let term3 = Term()
        term3.name = "If Statement"
        term3.definition = "Code that allows to go one way or another"
        term3.isType = false
        term3.color = "yellow"
        terms.append(term3)
        
        let term4 = Term()
        term4.name = "String"
        term4.definition = "A variable that contains words and letters"
        term4.isType = false
        term4.color = "green"
        terms.append(term4)
        
        let term5 = Term()
        term5.name = "Int"
        term5.definition = "A Variale that contains a natural number (No decimals, fractions, or negative numbers"
        term5.isType = false
        term5.color = "blue"
        terms.append(term5)
        
        let term6 = Term()
        term6.name = "Function"
        term6.definition = "A block of organized, reusable code that is used to perform a single, related action"
        term6.isType = false
        term6.color = "purple"
        terms.append(term6)

    }
    
    
    // How Many Rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return terms.count
    }

    // What Goes In Each Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if terms[indexPath.row].isType {
            cell.textLabel?.text = terms[indexPath.row].name + " - Type"
        } else {
            cell.textLabel?.text = terms[indexPath.row].name
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedTerm = terms[indexPath.row]
        
        performSegue(withIdentifier: "goToDefinition", sender: selectedTerm)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let codeVC = segue.destination as? CodeViewController{
            if let selectedTerm = sender as? Term {
                codeVC.term = selectedTerm
            }
        }
    }
    
}
