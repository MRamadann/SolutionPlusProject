//
//  Product.swift
//  SolutionPlusProject
//
//  Created by Apple on 11/04/2024.
//

import Foundation

struct ProductModel: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let price: Double?
    let discountPercentage: Double?
    let rating: Double?
    let stock: Int?
    let brand: String?
    let category: String?
    let thumbnail: String?
    let images: [String]?
}

struct ProductAPIResponse: Codable {
    let products: [ProductModel]
    let total: Int
    let skip: Int
    let limit: Int
}
