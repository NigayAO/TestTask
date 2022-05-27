//
//  TableViewModel.swift
//  TestForWork
//
//  Created by Alik Nigay on 27.05.2022.
//

import Foundation

protocol MainTableViewModelProtocol {
    
    var cellElements: [String] { get }
    var numberOfCells: Int { get }
    var seguePicture: String { get }
    var segueSelector: String { get }
    
    func fetchData(completion: @escaping() -> Void)
    func transferData(name: String) -> InternalData
}

class MainTableViewModel: MainTableViewModelProtocol {
    
    private var arrayOfData = [ExternalData]()
    
    var cellElements = [String]()
    
    var numberOfCells: Int {
        cellElements.count
    }
    
    var seguePicture: String {
        "withImage"
    }
    
    var segueSelector: String {
        "withSelector"
    }
    
    func fetchData(completion: @escaping() -> Void) {
        
        NetworkManager.shared.fetchNewData { data in
            self.arrayOfData = data.data
            self.cellElements = data.view
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func transferData(name: String) -> InternalData {
        var data = arrayOfData[0].data
        for item in arrayOfData {
            if item.name == name {
                data = item.data
            }
        }
        return data
    }
}
