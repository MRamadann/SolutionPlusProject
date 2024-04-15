//
//  LoginEndpoint.swift
//  SolutionPlusProject
//
//  Created by Apple on 08/04/2024.
//

import Foundation
import MyUIUtilities

enum loginEndpoint {
    case loginRequest
}

extension loginEndpoint : Endpoint {
    var baseURL: URL {
        switch self {
        case .loginRequest:
            return URL(string: "https://dummyjson.com/auth")!
        }
    }
    var path: String {
        switch self {
        case .loginRequest:
            return "https://dummyjson.com/auth/login"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .loginRequest:
            return .post
        }
    }
    var header: [String : String]? {
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
        return ""
    }
    
    var host: String? {
        return ""
    }
}
