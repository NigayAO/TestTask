//
//  PictureViewModel.swift
//  TestForWork
//
//  Created by Alik Nigay on 27.05.2022.
//

import Foundation

protocol PictureViewModelProtocol {
    
    var name: String { get }
    
    func getImageData(completion: @escaping(Data) -> Void)
    
    init(receivedData: InternalData)
}

class PictureViewModel: PictureViewModelProtocol {
    var name: String {
        receivedData.text ?? "Something goes wrong"
    }
    
    private let receivedData: InternalData!
    
    func getImageData(completion: @escaping(Data) -> Void) {
        DispatchQueue.global(qos: .utility).async {
            guard let imageData = NetworkManager.shared.fetchImage(urlString: self.receivedData.url ?? "") else {
                return
            }
            DispatchQueue.main.async {
                completion(imageData)
            }
        }
    }
    
    required init(receivedData: InternalData) {
        self.receivedData = receivedData
    }
}
