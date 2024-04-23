//
//  BaseProductRepository.swift
//  SolutionPlusProject
//
//  Created by Apple on 23/04/2024.
//
import Foundation
import Combine

class BaseProductRepository: ProductRepositoryProtocol {
    private let remoteRepository: RemoteProductRepositoryProtocol = RemoteProductRepository()
    private let localRepository: LocalProductRepositoryProrocol = LocalProductRepository()

//    init(remoteRepository: RemoteProductRepositoryProtocol = RemoteProductRepository(),
//         localRepository: LocalProductRepositoryProrocol = LocalProductRepository()) {
//        self.remoteRepository = remoteRepository
//        self.localRepository = localRepository
//    }

    func saveProductsToCoreData(_ products: ProductAPIResponse) {
        localRepository.saveProductsToCoreData(products)
    }

    func fetchProductsFromCoreData() -> AnyPublisher<[ProductsData], Error> {
        return localRepository.fetchProductsFromCoreData()
    }

    func getProducts(endpoint: ProductEndpoint) -> AnyPublisher<ProductAPIResponse, Error> {
        return remoteRepository.fetchRemoteProducts(endpoint: endpoint)
    }
}
