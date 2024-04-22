//
//  ProductRepositoryProtocol.swift
//  SolutionPlusProject
//
//  Created by Apple on 22/04/2024.
//

import Foundation
import Combine

protocol ProductRepositoryProtocol {
    func getProducts(endpoint: ProductEndpoint) -> AnyPublisher<ProductAPIResponse, Error>
    func saveProductsToCoreData(_ products: ProductAPIResponse)
    func fetchProductsFromCoreData() -> AnyPublisher<[ProductsData], Error>
}
