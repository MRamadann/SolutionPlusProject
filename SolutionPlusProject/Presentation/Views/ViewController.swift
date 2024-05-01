//
//  ViewController.swift
//  SolutionPlusProject
//
//  Created by Apple on 08/04/2024.

import UIKit

class ViewController: UIViewController {
    // Declare a property for the view model
    var viewModel = ProductListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchProducts()
        let button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
        button.setTitle("Test Crash", for: [])
        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        let numbers = [0]
        let _ = numbers[1]
    }
}
