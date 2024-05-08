//
//  RequestTest.swift
//  SolutionPlusProjectTests
//
//  Created by Apple on 06/05/2024.
//

import Foundation
import MyUIUtilities

public class RequestTest: Endpoint {
    override init() {
        super.init()
        method = .post
        guard let bundle = Bundle.testBundle.path(forResource: "products", ofType: ".json") else {
            return }
        path = bundle
        scheme = nil
        print(url)
    }
}


