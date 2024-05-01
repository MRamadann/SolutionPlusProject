//
//  ViewModelTests.swift
//  SolutionPlusProject
//
//  Created by Apple on 01/05/2024.
//

import XCTest

import XCTest

class ProductListViewModelTests: XCTestCase {
    var viewModel: ProductListViewModel!
    var mockFetchProductsUseCase: MockFetchProductsUseCase!
    override func setUpWithError() throws {
        viewModel = ProductListViewModel()
        mockFetchProductsUseCase = MockFetchProductsUseCase()
        viewModel.setFetchProductsUseCase(mockFetchProductsUseCase)
    }
    override func tearDownWithError() throws {
        viewModel = nil
        mockFetchProductsUseCase = nil
    }
    func testFetchProducts() {
        viewModel.fetchProducts()
        XCTAssertTrue(mockFetchProductsUseCase.fetchProductsFromCoreDataCalled)
        XCTAssertTrue(mockFetchProductsUseCase.fetchRemoteProductsCalled)
    }
}

