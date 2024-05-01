//
//  BaseViewmodel.swift
//  SolutionPlusProject
//
//  Created by Apple on 23/04/2024.
//

import Foundation
import Combine

protocol BaseViewModel {
  func startSynching()
}
enum ChangeBaseVm {
    case update
    case error(error: String)
}
