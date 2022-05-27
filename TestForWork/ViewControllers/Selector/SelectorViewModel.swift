//
//  SelectorViewModel.swift
//  TestForWork
//
//  Created by Alik Nigay on 27.05.2022.
//

import Foundation

protocol SelectorTableViewModelProtocol {
    
    var numbersOfItems: Int { get }
    var variants: [Variant] { get }
    
    init(receivedData: InternalData)
}

class SelectorTableViewModel: SelectorTableViewModelProtocol {
    
    var numbersOfItems: Int {
        receivedData.variants?.count ?? 0
    }
    
    var variants: [Variant] {
        receivedData.variants ?? [Variant]()
    }
    
    private let receivedData: InternalData!
    
    required init(receivedData: InternalData) {
        self.receivedData = receivedData
    }
}
