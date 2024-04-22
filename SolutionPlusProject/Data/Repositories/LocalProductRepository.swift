import Foundation
import CoreData
import Combine

class LocalProductRepository: LocalProductRepositoryProrocol {
    private let coreDataStack: CoreDataStack = CoreDataStack()
    func saveProductsToCoreData(_ products: ProductAPIResponse ) {
        coreDataStack.saveProductsToCoreData(products)
    }
    func fetchProductsFromCoreData() -> AnyPublisher<[ProductsData], Error> {
        coreDataStack.fetchProductsFromCoreData()
    }
}
