//
//  DataModel.swift
//  TestForWork
//
//  Created by Alik Nigay on 26.05.2022.
//

import Foundation

struct IncomeData: Codable {
    let data: [ExternalData]
    let view: [String]
}

struct ExternalData: Codable {
    let name: String
    let data: InternalData
}

struct InternalData: Codable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?
    
    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
    }
}

struct Variant: Codable {
    let id: Int
    let text: String
}
