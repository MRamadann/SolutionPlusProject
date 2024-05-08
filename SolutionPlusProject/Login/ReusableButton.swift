//
//  ReusableButton.swift
//  SolutionPlusProject
//
//  Created by Apple on 06/05/2024.
//

import UIKit
import MyUIUtilities

class ReusableButton: UIView {
    @IBOutlet weak var Button: UIButton!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        let nib = UINib(nibName: "ReusableButton", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        addSubview(Button)
        Button.frame = bounds
        Button.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) {
        Button.addTarget(target, action: action, for: event)
    }
}

