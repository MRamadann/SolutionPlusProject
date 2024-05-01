//
//  ProductDependanciesFactory.swift
//  SolutionPlusProject
//
//  Created by Apple on 23/04/2024.
//

import Foundation
import Factory

extension Container {
    var getProductUseCase: Factory<FetchProductsUseCaseProtocol> {
        Factory(self) { self.getProductUseCase() }
    }
    var getProductRemote: Factory<RemoteProductRepository> {
        Factory(self) { self.getProductRemote() }
    }
    var getProductLocal: Factory<LocalProductRepositoryProrocol> {
        Factory(self) { self.getProductLocal() }
    }
    var getProductRepository: Factory<ProductRepositoryProtocol> {
        Factory(self) { self.getProductRepository() }
    }
}
