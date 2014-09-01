//
//  MASExampleListViewController.swift
//  Swift-Masonry
//
//  Created by Christian Noon on 8/31/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import UIKit

class MASExampleListViewController: UITableViewController {

    struct Example {
        var name: String
        var viewType: NSObject.Type
    }

    let kMASCellReuseIdentifier = "kMASCellReuseIdentifier"
    var examples: [Example]!

    // MARK: - View Lifecycle Method(s)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpInstanceVariables()
        setUpTableView()
    }

    // MARK: - Set Up Method(s)

    func setUpInstanceVariables() {
        title = "Examples"
        examples = [
            Example(name: "Basic", viewType: MASExampleBasicView.self),
            Example(name: "Update Constraints", viewType: MASExampleUpdateConstraintsView.self),
            Example(name: "Remake Constraints", viewType: MASExampleRemakeConstraintsView.self),
            Example(name: "Using Constants", viewType: MASExampleUsingConstantsView.self),
            Example(name: "Composite Edges", viewType: MASExampleCompositeEdgesView.self),
            Example(name: "Basic Animation", viewType: MASExampleBasicAnimationView.self)
        ]
    }
    
    func setUpTableView() {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: kMASCellReuseIdentifier)
    }
    
    // MARK: - UITableViewDataSource Method(s)
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCellWithIdentifier(kMASCellReuseIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = examples[indexPath.row].name
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    // MARK: - UITableViewDelegate Method(s)
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let example = examples[indexPath.row]
        let viewController = MASExampleViewController(exampleTitle: example.name, exampleViewType: example.viewType)
        navigationController.pushViewController(viewController, animated: true)
    }
}
