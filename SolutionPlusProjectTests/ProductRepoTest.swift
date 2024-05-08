//
//  ProductRepoTest.swift
//  SolutionPlusProject
//
//  Created by Apple on 01/05/2024.
//

import XCTest
import Combine
@testable import SolutionPlusProject

class ProductRepositoryTests: XCTestCase {
    var repository: ProductRepository!
    var cancellables = Set<AnyCancellable>()
    override func setUpWithError() throws {
        repository = ProductRepository()
    }

    override func tearDownWithError() throws {
        cancellables.removeAll()
    }
    func testFetchProductsFromCoreData() {
        let expectation = XCTestExpectation(description: "Fetch products from CoreData")
        
        repository.fetchProductsFromCoreData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Failed to fetch products from CoreData with error: \(error)")
                }
            }, receiveValue: { productsData in
                XCTAssertNotNil(productsData)
                XCTAssertGreaterThan(productsData.count, 0)
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
    }
    func testGetProducts() {
        let expectation = XCTestExpectation(description: "Get products from remote")
        
        repository.getProducts(endpoint: .getProducts)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure(let error):
                    XCTFail("Failed to get products from remote with error: \(error)")
                }
            }, receiveValue: { response in
                XCTAssertNotNil(response)
                XCTAssertGreaterThan(response.products.count, 0)
            })
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5.0)
    }
}

