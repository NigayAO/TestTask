//
//  SelectorTableViewController.swift
//  TestForWork
//
//  Created by Alik Nigay on 26.05.2022.
//

import UIKit

class SelectorTableViewController: UITableViewController {
    
    var receivedData: InternalData!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "selector"
        print(receivedData!)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        receivedData.variants?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selector", for: indexPath)
        let variant = receivedData.variants?[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = variant?.text
        content.secondaryText = "ID - \(variant?.id ?? 0)"
        cell.contentConfiguration = content
        return cell
    }
}
