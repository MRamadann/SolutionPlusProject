//
//  LocalProductRepositoryProrocol.swift
//  SolutionPlusProject
//
//  Created by Apple on 22/04/2024.
//

import Foundation
import Combine

protocol LocalProductRepositoryProrocol {
    func saveProductsToCoreData(_ products: ProductAPIResponse)
    func fetchProductsFromCoreData() -> AnyPublisher<[ProductsData], Error>
}
