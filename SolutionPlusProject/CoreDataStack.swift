//
//  CoreDataStack.swift
//  SolutionPlusProject
//
//  Created by Apple on 14/04/2024.
//

import CoreData
import Combine

class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()
    var managedObjcontext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    private init() {}
    
    func saveProductsToCoreData(_ products: ProductAPIResponse) {
        // Iterate over each product and insert it into Core Data
        for product in products.products {
            let productEntity = ProductsData(context: managedObjcontext)
            productEntity.price = product.price ?? 1
            productEntity.category = product.category
            productEntity.id = Int16(product.id!)
            productEntity.title = product.title
            
            // Save changes to Core Data
            do {
                try managedObjcontext.save()
            } catch {
                print("Error saving product: \(error)")
            }
        }
    }
    
    func fetchProductsFromCoreData() -> AnyPublisher<[ProductsData], Error>{
        let fetchRequest: NSFetchRequest<ProductsData> = ProductsData.fetchRequest()
        return Future<[ProductsData], Error> { promise in
            do {
                let products = try self.managedObjcontext.fetch(fetchRequest)
                promise(.success(products))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
}
