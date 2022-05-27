//
//  SelectorTableViewController.swift
//  TestForWork
//
//  Created by Alik Nigay on 26.05.2022.
//

import UIKit

class SelectorTableViewController: UITableViewController {
    
    var viewModel: SelectorTableViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "selector"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numbersOfItems
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selector", for: indexPath)
        
        let variant = viewModel.variants[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = variant.text
        content.secondaryText = "ID - \(variant.id)"
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
