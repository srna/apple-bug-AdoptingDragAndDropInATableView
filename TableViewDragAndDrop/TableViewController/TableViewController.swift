/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Demonstrates how to enable drag and drop for a UITableView instance.
*/

import UIKit

class TableViewController: UIViewController {
    // MARK: - Properties
    
    var model = Model()

    let tableView = UITableView(frame: .zero)

    lazy var dataSource: UITableViewDiffableDataSource<Int, String> = {
        UITableViewDiffableDataSource(tableView: tableView) { [unowned self] tableView, indexPath, itemIdentifier in
            let cell = UITableViewCell()
            cell.textLabel?.text = model.placeNames[indexPath.row]
            return cell
        }
    }()

    // MARK: - View Life Cycle

    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground

        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // Specify the table as its own drag source and drop delegate.
    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.dataSource = self
//        tableView.delegate = self
        
        tableView.dragInteractionEnabled = true
        tableView.dragDelegate = self
        tableView.dropDelegate = self

        var snapshot = NSDiffableDataSourceSnapshot<Int, String>()
        snapshot.appendSections([0])
        snapshot.appendItems(model.placeNames, toSection: 0)
        dataSource.apply(snapshot)
    }
}
