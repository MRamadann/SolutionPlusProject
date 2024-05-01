//
//  ProductListViewModel.swift
//  SolutionPlusProject
//
//  Created by Apple on 15/04/2024.
//

import Foundation
import Combine

class ProductListViewModel: BaseViewModel {
    func startSynching() {
    }
    private var fetchProductsUseCase = FetchProductsUseCase()
    func fetchProducts() {
        fetchProductsUseCase.fetchProductsFromCoreData()
        fetchProductsUseCase.fetchRemoteProducts()
    }
}
