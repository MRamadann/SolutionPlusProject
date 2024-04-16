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

protocol FetchProductsUseCaseProtocol {
        func fetchRemoteProducts()
        func fetchProductsFromCoreData()
}

protocol ProductUsecaseDelegate {
    func getProduct(product: ProductAPIResponse)
    func getCached(product: [ProductsData])
}

class FetchProductsUseCase: FetchProductsUseCaseProtocol {
    var cancellables = Set<AnyCancellable>()
    private let productRepository: ProductRepositoryProtocol
    public var delegate: ProductUsecaseDelegate?
    
    init(productRepository: ProductRepositoryProtocol) {
        self.productRepository = productRepository
    }

    func fetchRemoteProducts()  {
        let fetchProductsEndpoint = ProductEndpoint.getProducts
        productRepository.fetchRemoteProducts()
            .sink (
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error)
                    }
                },
                receiveValue: { (productResponse: ProductAPIResponse) in
                    print(productResponse)
                    self.delegate?.getProduct(product: productResponse)
                }
            )
            .store(in: &cancellables)
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
                print(productsData)
                self.delegate?.getCached(product: productsData)
            }
            .store(in: &cancellables)
    }
}
