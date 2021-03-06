//
//  ViewController.swift
//  DoReMi
//
//  Created by Jason Schatz on 11/18/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITableViewDataSource

class ViewController: UIViewController, UITableViewDataSource {

    // MARK: Properties
    
    // Use this string property as your reuse identifier, 
    // Storyboard has been set up for you using this String.
    let cellReuseIdentifier = "MyCellReuseIdentifier"
    
    // Choose some data to show in your table
    
    let model: [String] = [
        // TODO: Fill this array with data
        "Do", "detailed Do",
        "Re", "detailed Re",
        "Mi", "detailed Mi"
    ]
    
    // MARK: UITableViewDataSource
    
    // Add the two essential table data source methods here
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Implement method to return the correct number of rows.
        return (self.model.count)/2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Implement method to return cell with the correct reuseidentifier and populated with the correct data.
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellReuseIdentifier)!
        cell.textLabel?.text = self.model[indexPath.row * 2]
        cell.detailTextLabel?.text = self.model[indexPath.row * 2 + 1]
        
//        let placeholderCell = UITableViewCell()
        return cell
    }
}
