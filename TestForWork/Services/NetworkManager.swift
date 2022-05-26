//
//  NetworkManager.swift
//  TestForWork
//
//  Created by Alik Nigay on 26.05.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case descriptionError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private let urlString = "https://pryaniky.com/static/json/sample.json"
    
    private init() {}
        
    func fetchData(completion: @escaping(Result<IncomeData, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                
                let receivedData = try JSONDecoder().decode(IncomeData.self, from: data)
                completion(.success(receivedData))
                
            } catch {
                completion(.failure(.descriptionError))
            }
        }.resume()
    }
    
    func fetchImage(urlString: String) -> Data? {
        guard let url = URL(string: urlString) else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
}
