//
//  RemoteProductRepositoryProtocol.swift
//  SolutionPlusProject
//
//  Created by Apple on 22/04/2024.
//

import Foundation
import Combine

protocol RemoteProductRepositoryProtocol {
    func fetchRemoteProducts(endpoint: ProductEndpoint) -> AnyPublisher<ProductAPIResponse, Error>
}
