//
//  TableViewController.swift
//  TestForWork
//
//  Created by Alik Nigay on 26.05.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
        
    private var viewModel: MainTableViewModelProtocol! {
        didSet {
            viewModel.fetchData {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainTableViewModel()        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            
        case viewModel.seguePicture:
            guard let pictureVC = segue.destination as? PictureViewController else { return }
            pictureVC.viewModel = sender as? PictureViewModelProtocol
            
        default:
            guard let selectorTVC = segue.destination as? SelectorTableViewController else { return }
            selectorTVC.viewModel = sender as? SelectorTableViewModelProtocol
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfCells
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "data", for: indexPath)
        
        let titleForCell = viewModel.cellElements[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = titleForCell
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = viewModel.cellElements[indexPath.row]
        let transferData = viewModel.transferData(name: selectedCell)
        
        switch selectedCell {
        case "hz":
            guard let text = transferData.text else { return }
            showAlert(title: selectedCell, message: text)
            
        case "picture":
            let pictureViewModel = PictureViewModel(receivedData: transferData)
            performSegue(withIdentifier: viewModel.seguePicture, sender: pictureViewModel)
            
        default:
            let selectorTVCViewModel = SelectorTableViewModel(receivedData: transferData)
            performSegue(withIdentifier: viewModel.segueSelector, sender: selectorTVCViewModel)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - Private methods
extension MainTableViewController {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: "ID - \(title)", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
