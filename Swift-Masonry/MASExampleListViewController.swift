//
//  MASExampleListViewController.swift
//  Swift-Masonry
//
//  Created by Christian Noon on 8/31/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import UIKit

class MASExampleListViewController: UITableViewController {
    let kMASCellReuseIdentifier = "kMASCellReuseIdentifier"
    var exampleViewControllers: [MASExampleViewController]!

    // MARK: - View Lifecycle Method(s)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpInstanceVariables()
        setUpTableView()
    }

    // MARK: - Set Up Method(s)

    func setUpInstanceVariables() {
        title = "Examples"
        exampleViewControllers = [
            MASExampleViewController(exampleTitle: "Basic", exampleViewType: MASExampleBasicView.self),
            MASExampleViewController(exampleTitle: "Update Constraints", exampleViewType: MASExampleUpdateView.self),
        ]
    }
    
    func setUpTableView() {
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: kMASCellReuseIdentifier)
    }
    
    // MARK: - UITableViewDataSource Method(s)
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return exampleViewControllers.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCellWithIdentifier(kMASCellReuseIdentifier, forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = exampleViewControllers[indexPath.row].exampleTitle
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    // MARK: - UITableViewDelegate Method(s)
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        navigationController.pushViewController(exampleViewControllers[indexPath.row], animated: true)
    }
}
