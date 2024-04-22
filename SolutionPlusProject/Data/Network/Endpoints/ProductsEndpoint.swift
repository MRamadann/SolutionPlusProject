//
//  ProductsEndpoint.swift
//  SolutionPlusProject
//
//  Created by Apple on 11/04/2024.
//
import Foundation
import MyUIUtilities

enum ProductEndpoint {
    case getProducts
}

extension ProductEndpoint: Endpoint {
    var baseURL: URL {
        switch self {
        case .getProducts:
            return URL(string: "https://dummyjson.com")!
        }
    }
    var path: String {
        switch self {
        case .getProducts:
            return "/products"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getProducts:
            return .get
        }
    }
    var header: [String: String]? {
        return nil
    }
    var body: Data? {
        return nil
    }
    var scheme: String? {
        return nil
    }
    var host: String? {
        return nil
    }
}
