//
//  ProductListViewModel.swift
//  SolutionPlusProject
//
//  Created by Apple on 15/04/2024.
//

import Foundation
import Combine

class ProductListViewModel: ProductUsecaseDelegate {

    private let fetchProductsUseCase: FetchProductsUseCase
    @Published var products: ProductAPIResponse?
    @Published var cachedProducts: [ProductsData]?
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(fetchProductsUseCase: FetchProductsUseCase) {
        self.fetchProductsUseCase = fetchProductsUseCase
    }
    
    func getProduct(product: ProductAPIResponse) {
        self.products = product
    }
    func getCached(product: [ProductsData]) {
        self.cachedProducts = product
    }
    
    func fetchProducts() {
        fetchProductsUseCase.delegate = self
        fetchProductsUseCase.fetchRemoteProducts()
        fetchProductsUseCase.fetchProductsFromCoreData()
    }
}
