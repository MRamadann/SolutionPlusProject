//
//  ProductDependanciesFactory.swift
//  SolutionPlusProject
//
//  Created by Apple on 23/04/2024.

//import Foundation
//import Combine
//import CoreData
//import MyUIUtilities
//
//class ProductDependenciesFactory {
//  static func createProductDependencies() -> (
//    productListViewModel: ProductListViewModel,
//    remoteRepository: RemoteProductRepositoryProtocol,
//    localRepository: LocalProductRepositoryProrocol
//  ) {
//    let localRepository = LocalProductRepository() // Replace with concrete implementation
//    let remoteRepository = RemoteProductRepository() // Replace with concrete implementation
//    let productRepository = ProductRepository(remoteRepository: remoteRepository, localRepository: localRepository)
//    let fetchProductsUseCase = FetchProductsUseCase(productRepository: productRepository)
//    let productListViewModel = ProductListViewModel(fetchProductsUseCase: fetchProductsUseCase)
//
//    return (productListViewModel, remoteRepository, localRepository)
//  }
//}
//import Foundation
//
//protocol ProductDependencyFactory {
//    func makeProductRepository() -> ProductRepositoryProtocol
//    func makeFetchProductsUseCase() -> FetchProductsUseCaseProtocol
//}
//
//class DefaultProductDependencyFactory: ProductDependencyFactory {
//    func makeProductRepository() -> ProductRepositoryProtocol {
//        return ProductRepository()
//    }
//    
//    func makeFetchProductsUseCase() -> FetchProductsUseCaseProtocol {
//        return FetchProductsUseCase()
//    }
//}
