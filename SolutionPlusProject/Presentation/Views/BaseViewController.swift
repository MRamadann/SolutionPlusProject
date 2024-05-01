//
//  BaseViewController.swift
//  SolutionPlusProject
//
//  Created by Apple on 28/04/2024.
//

import Foundation
import UIKit

protocol BaseViewControllerProtocol {
    func setupUI()
}
public class BaseViewController: UIViewController {
    var viewModel: BaseViewModel?
    var loading: UIView?
    override public func viewDidLayoutSubviews() {
        self.loading?.center = self.view.center
    }
}
