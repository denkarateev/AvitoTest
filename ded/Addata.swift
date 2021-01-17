//
//  AdData.swift
//  adAvito
//
//  Created by Денис Каратеев on 10.01.2021.
//

import Foundation
// MARK: - AdData
struct AdData: Codable {
    let status: String
    let result: Result
    
}

// MARK: - Result
struct Result: Codable {
    let title, actionTitle, selectedActionTitle: String
    let list: [List]
}

// MARK: - List
struct List: Codable {
    let id, title: String
    let listDescription: String?
    let icon: Icon
    let price: String
    let isSelected: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id", title = "title"
        case listDescription = "description"
        case icon = "icon", price = "price", isSelected = "isSelected"
    }
}

// MARK: - Icon
struct Icon: Codable {
    let the52X52: String
    enum CodingKeys: String, CodingKey {
        case the52X52 = "52x52"
    }
}
