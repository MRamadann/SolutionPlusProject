//
//  RemoteProductRepository.swift
//  SolutionPlusProject
//
//  Created by Apple on 15/04/2024.
//

import Foundation
import Combine
import MyUIUtilities

class RemoteProductRepository: RemoteProductRepositoryProtocol {
    var apiClient = URLSessionAPIClient<ProductEndpoint>()
    private var cancellables = Set<AnyCancellable>()
    //    init(apiClient: URLSessionAPIClient<ProductEndpoint>) {
    //        self.apiClient = apiClient
    //    }
    func fetchRemoteProducts(endpoint: ProductEndpoint) -> AnyPublisher<ProductAPIResponse, Error> {
        return apiClient.request(endpoint)
    }
}
