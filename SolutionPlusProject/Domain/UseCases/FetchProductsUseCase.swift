//
//  FetchProductsUseCase.swift
//  SolutionPlusProject
//
//  Created by Apple on 15/04/2024.
//

import Foundation
import Combine
import CoreData
import MyUIUtilities

class FetchProductsUseCase: FetchProductsUseCaseProtocol {
    var cancellables = Set<AnyCancellable>()
    private let productRepository: ProductRepositoryProtocol = ProductRepository()
    func fetchRemoteProducts() {
        let fetchProductsEndpoint = ProductEndpoint.getProducts
        productRepository.getProducts(endpoint: fetchProductsEndpoint)
            .sink( receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            },
                   receiveValue: { (productResponse: ProductAPIResponse) in
                print("Start \(productResponse) End")
            }
            )
            .cancel()
    }
    func fetchProductsFromCoreData() {
        productRepository.fetchProductsFromCoreData()
            .sink { comletion in
                switch comletion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { productsData in
                print("Start2 \(productsData) End2")
            }
            .store(in: &cancellables)
    }
}
