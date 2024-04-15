//
//  ViewController.swift
//  SolutionPlusProject
//
//  Created by Apple on 08/04/2024.
//

import UIKit
import Combine
import MyUIUtilities
import CoreData

class ViewController: UIViewController {
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    
    func fetchData() {
        let products = fetchProductsFromCoreData()
        if products.isEmpty {
            // If no products are found in Core Data, fetch them from the API
            fetchDataFromApi()
        } else {
            // If products are found in Core Data, use them
            var productsVar = fetchProductsFromCoreData()
            for data in productsVar {
                print(data.category ?? "")
            }
        }
    }

    func fetchDataFromApi() {
        let apiClient = URLSessionAPIClient<ProductEndpoint>()
        apiClient.request(ProductEndpoint.getProducts)
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error)
                    }
                },
                receiveValue: { (productResponse: ProductAPIResponse) in
                    print(productResponse)
                    self.saveProductsToCoreData(productResponse)
                   
                }
            )
            .store(in: &cancellables)
    }
    
    func saveProductsToCoreData(_ products: ProductAPIResponse) {
        // Create a managed object context
        let context = CoreDataStack.shared.persistentContainer.viewContext
        
        // Iterate over each product and insert it into Core Data
        for product in products.products {
            let productEntity = ProductsData(context: context)
            productEntity.price = product.price
            productEntity.category = product.category
            productEntity.id = Int16(product.id)
            productEntity.title = product.title
            
            // Save changes to Core Data
            do {
                try context.save()
            } catch {
                print("Error saving product: \(error)")
            }
        }
    }
    
    func fetchProductsFromCoreData() -> [ProductsData] {
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<ProductsData> = ProductsData.fetchRequest()
        do {
            let products = try context.fetch(fetchRequest)
            return products
        } catch {
            print("Error fetching products from Core Data: \(error)")
            return []
        }
    }
}


