//
//  BaseUsecase.swift
//  SolutionPlusProject
//
//  Created by Apple on 23/04/2024.
//
import Foundation
import Combine

class BaseFetchProductsUseCase {
    var cancellables = Set<AnyCancellable>()
    let productRepository: ProductRepositoryProtocol = ProductRepository()

//    init(productRepository: ProductRepositoryProtocol) {
//        self.productRepository = productRepository
//    }

    func fetchRemoteProducts() {
        fatalError("Subclasses must override fetchRemoteProducts()")
    }

    func fetchProductsFromCoreData() {
        fatalError("Subclasses must override fetchProductsFromCoreData()")
    }
}
