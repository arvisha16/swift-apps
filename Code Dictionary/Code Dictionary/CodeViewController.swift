//
//  CodeViewController.swift
//  Code Dictionary
//
//  Created by Aryan on 6/29/20.
//  Copyright © 2020 Aryan. All rights reserved.
//

import UIKit

class CodeViewController: UIViewController {

    @IBOutlet weak var definitionLabel: UILabel!
    var term = Term()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let textColor = UIColor(named: term.color)
        title = term.name
        definitionLabel.text = term.definition
        if term.color == "red" {
            definitionLabel.textColor = .red
        } else if term.color == "orange" {
            definitionLabel.textColor = .orange
        } else if term.color == "yellow" {
            definitionLabel.textColor = .systemYellow
        } else if term.color == "green" {
            definitionLabel.textColor = .green
        } else if term.color == "blue" {
            definitionLabel.textColor = .blue
        } else if term.color == "purple" {
            definitionLabel.textColor = .purple
        }
        
        //if term.isType {
            //definitionLabel.textColor = .purple
        //}

    }
}
