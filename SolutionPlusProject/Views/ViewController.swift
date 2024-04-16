//
//  ViewController.swift
//  SolutionPlusProject
//
//  Created by Apple on 08/04/2024.

import UIKit
import Combine
import MyUIUtilities
import CoreData

class ViewController: UIViewController {
    var viewModel: ProductListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchProducts()
    }
}




    
    
   