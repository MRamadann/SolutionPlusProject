//
//  DefaultProductRepository.swift
//  SolutionPlusProject
//
//  Created by Apple on 15/04/2024.
//

import Foundation
import Combine

protocol ProductRepositoryProtocol {
    func getProducts(endpoint: ProductEndpoint) -> AnyPublisher<ProductAPIResponse, Error>
    func saveProductsToCoreData(_ products: ProductAPIResponse)
    func fetchProductsFromCoreData() -> AnyPublisher<[ProductsData], Error>
}

class ProductRepository: ProductRepositoryProtocol {
    private let remoteRepository: RemoteProductRepository
    private let localRepository: LocalProductRepository
    
    init(remoteRepository: RemoteProductRepository, localRepository: LocalProductRepository) {
        self.remoteRepository = remoteRepository
        self.localRepository = localRepository
    }
    
    func saveProductsToCoreData(_ products: ProductAPIResponse) {
        localRepository.saveProductsToCoreData(products)
    }
    
    func fetchProductsFromCoreData() -> AnyPublisher<[ProductsData], Error> {
        localRepository.fetchProductsFromCoreData()
    }
    
    func getProducts(endpoint: ProductEndpoint) -> AnyPublisher<ProductAPIResponse, Error> {
       return remoteRepository.fetchRemoteProducts(endpoint: endpoint)
    }
}
