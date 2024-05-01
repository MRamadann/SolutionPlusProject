//
//  LoginEndpoint.swift
//  SolutionPlusProject
//
//  Created by Apple on 08/04/2024.
//

import Foundation
import MyUIUtilities

enum LoginEndpoint {
    case loginRequest
}

extension LoginEndpoint: Endpoint {
    var baseURL: URL {
        switch self {
        case .loginRequest:
            return URL(string: "https://dummyjson.com")!
        }
    }
    var path: String {
        switch self {
        case .loginRequest:
            return "/auth/login"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .loginRequest:
            return .post
        }
    }
    var header: [String: String]? {
        switch self {
        case .loginRequest:
            return [ "Content-Type": "application/json"]
        }
    }
    var body: Data? {
        switch self {
        case .loginRequest:
            return try? JSONEncoder().encode(LoginRequest(userName: "kminchelle", password: "0lelplR"))
        }
    }
    var scheme: String? {
        return nil
    }
    var host: String? {
        return nil
    }
}
