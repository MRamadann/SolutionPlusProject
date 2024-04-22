//
//  ProductListViewModel.swift
//  SolutionPlusProject
//
//  Created by Apple on 15/04/2024.
//

import Foundation
import Combine

class ProductListViewModel {
    private var fetchProductsUseCase: FetchProductsUseCaseProtocol = FetchProductsUseCase()
//    @Published var cachedProducts: [ProductsData]?
//    @Published var errorMessage: String?
//    private var cancellables = Set<AnyCancellable>()

    func fetchProducts() {
        fetchProductsUseCase.fetchProductsFromCoreData()
        fetchProductsUseCase.fetchRemoteProducts()
    }
}
