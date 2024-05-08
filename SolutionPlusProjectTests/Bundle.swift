//
//  Bundle.swift
//  SolutionPlusProjectTests
//
//  Created by Apple on 06/05/2024.
//

import Foundation

extension Bundle {
    public class var testBundle: Bundle {
        return Bundle(for: vcTest.self)
    }
}
