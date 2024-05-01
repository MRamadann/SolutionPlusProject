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

class FetchProductsUseCase: BaseFetchProductsUseCase {
    override func fetchRemoteProducts() {
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

    override func fetchProductsFromCoreData() {
        assert(Thread.isMainThread, "fetchProductsFromCoreData must be called on the main thread.")
        productRepository.fetchProductsFromCoreData()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { productsData in
                print("Start2 \(productsData.count) End2")
            }
            .store(in: &cancellables)
    }
}
