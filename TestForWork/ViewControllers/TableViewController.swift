//
//  TableViewController.swift
//  TestForWork
//
//  Created by Alik Nigay on 26.05.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    var data: IncomeData!
    var array = [String]()
    var selectedCell: InternalData!
    
    private let segueHZ = "withHZ"
    private let seguePicture = "withImage"
    private let segueSelector = "withSelector"

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case segueHZ:
            guard let hzVC = segue.destination as? HZViewController else { return }
            hzVC.receivedData = selectedCell
        case seguePicture:
            guard let pictureVC = segue.destination as? PictureViewController else { return }
            pictureVC.receivedData = selectedCell
        default:
            guard let selectorTVC = segue.destination as? SelectorTableViewController else { return }
            selectorTVC.receivedData = selectedCell
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath)
        let example = array[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = example
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectCell = array[indexPath.row]
        print(selectCell)
        for item in data.data {
            if item.name == selectCell {
                selectedCell = item.data
            }
        }
        switch selectCell {
        case "hz":
            performSegue(withIdentifier: segueHZ, sender: self)
        case "picture":
            performSegue(withIdentifier: seguePicture, sender: self)
        default:
            performSegue(withIdentifier: segueSelector, sender: self)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - Private methods
extension TableViewController {
    private func fetchData() {
        NetworkManager.shared.fetchData { result in
            switch result {
            case .success(let data):
                self.data = data
                self.array = data.view
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
