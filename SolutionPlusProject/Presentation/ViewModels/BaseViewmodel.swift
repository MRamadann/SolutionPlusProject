//
//  BaseViewmodel.swift
//  SolutionPlusProject
//
//  Created by Apple on 23/04/2024.
//

import Foundation
import Combine

class BaseProductListViewModel {
    private var fetchProductsUseCase = FetchProductsUseCase()

//    init(fetchProductsUseCase: FetchProductsUseCaseProtocol) {
//        self.fetchProductsUseCase = fetchProductsUseCase
//    }

    func fetchProducts() {
        fetchProductsUseCase.fetchProductsFromCoreData()
        fetchProductsUseCase.fetchRemoteProducts()
    }
}
