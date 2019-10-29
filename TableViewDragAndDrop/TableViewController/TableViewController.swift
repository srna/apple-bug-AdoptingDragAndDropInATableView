/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Demonstrates how to enable drag and drop for a UITableView instance.
*/

import UIKit

class TableViewController: UITableViewController {
    // MARK: - Properties
    
    var model = Model()
    
    // MARK: - View Life Cycle
    
    // Specify the table as its own drag source and drop delegate.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dragInteractionEnabled = true // Enable intra-app drags for iPhone.
        tableView.dragDelegate = self
        tableView.dropDelegate = self
    }
}
