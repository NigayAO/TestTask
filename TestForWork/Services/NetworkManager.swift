//
//  NetworkManager.swift
//  TestForWork
//
//  Created by Alik Nigay on 26.05.2022.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private let urlString = "https://pryaniky.com/static/json/sample.json"
    
    private init() {}
    
    func fetchNewData(completion: @escaping(IncomeData) -> Void) {
        AF.request(urlString)
            .validate()
            .responseDecodable(of: IncomeData.self) { response in
                switch response.result {
                case .success(let receivedData):
                    completion(receivedData)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func fetchImage(urlString: String) -> Data? {
        guard let url = URL(string: urlString) else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}
