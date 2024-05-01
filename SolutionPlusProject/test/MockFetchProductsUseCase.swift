//
//  MockFetchProductsUseCase.swift
//  SolutionPlusProject
//
//  Created by Apple on 01/05/2024.
//

import Foundation
import Combine

class MockFetchProductsUseCase: BaseFetchProductsUseCase {
    var fetchProductsFromCoreDataCalled = false
    var fetchRemoteProductsCalled = false

    override func fetchProductsFromCoreData() {
        fetchProductsFromCoreDataCalled = true
    }

    override func fetchRemoteProducts() {
        fetchRemoteProductsCalled = true
    }
}

