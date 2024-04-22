import Foundation
import CoreData
import Combine

protocol LocalProductRepositoryProrocol {
    func saveProductsToCoreData(_ products: ProductAPIResponse)
    func fetchProductsFromCoreData() -> AnyPublisher<[ProductsData], Error>
}
class LocalProductRepository: LocalProductRepositoryProrocol {
    private let coreDataStack: CoreDataStack = CoreDataStack()
    func saveProductsToCoreData(_ products: ProductAPIResponse ) {
        coreDataStack.saveProductsToCoreData(products)
    }
    func fetchProductsFromCoreData() -> AnyPublisher<[ProductsData], Error> {
        coreDataStack.fetchProductsFromCoreData()
    }
}
