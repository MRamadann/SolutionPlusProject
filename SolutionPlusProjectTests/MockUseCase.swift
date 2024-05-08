//
//  MockUseCase.swift
//  SolutionPlusProjectTests
//
//  Created by Apple on 08/05/2024.
//

import Foundation

public class MockUseCase: BaseFetchProductsUseCase {
    var fetchProductsFromCoreDataCalled = false
    var fetchRemoteProductsCalled = false

    override func fetchProductsFromCoreData() {
        fetchProductsFromCoreDataCalled = true
    }
    override func fetchRemoteProducts() {
        fetchRemoteProductsCalled = true
    }
}
