//
//  ViewModelTests.swift
//  SolutionPlusProject
//
//  Created by Apple on 01/05/2024.
//

import Foundation
//import XCTest
//@testable import SolutionPlusProject
//
//class ProductListViewModelTests: XCTestCase {
//    var viewModel: ProductListViewModel!
//    var mockFetchProductsUseCase: MockUseCase!
//    override func setUpWithError() throws {
//        viewModel = ProductListViewModel()
//        mockFetchProductsUseCase = MockFetchProductsUseCase()
//        viewModel.setFetchProductsUseCase(mockFetchProductsUseCase)
//    }
//    override func tearDownWithError() throws {
//        viewModel = nil
//        mockFetchProductsUseCase = nil
//    }
//    func testFetchProducts() {
//        viewModel.fetchProducts()
//        XCTAssertTrue(mockFetchProductsUseCase.fetchProductsFromCoreDataCalled)
//        XCTAssertTrue(mockFetchProductsUseCase.fetchRemoteProductsCalled)
//    }
//}
import XCTest

class ProductListViewModelTests: XCTestCase {

    var viewModel: ProductListViewModel!
    var mockFetchProductsUseCase: MockUseCase!

    override func setUpWithError() throws {
        viewModel = ProductListViewModel()
        mockFetchProductsUseCase = MockUseCase()
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

