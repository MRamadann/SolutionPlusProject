//
//  ProductListViewModel.swift
//  SolutionPlusProject
//
//  Created by Apple on 15/04/2024.
//

import Foundation
import Combine

class ProductListViewModel: BaseViewModel {
    public var fetchProductsUseCase: BaseFetchProductsUseCase = FetchProductsUseCase()
    func setFetchProductsUseCase(_ useCase: BaseFetchProductsUseCase) {
        fetchProductsUseCase = useCase
    }
    func startSynching() {
    }
    func fetchProducts() {
        fetchProductsUseCase.fetchProductsFromCoreData()
        fetchProductsUseCase.fetchRemoteProducts()
    }
}

