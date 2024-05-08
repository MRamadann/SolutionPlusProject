//
//  ReusableTextField.swift
//  SolutionPlusProject
//
//  Created by Apple on 15/04/2024.
//

import UIKit
import MyUIUtilities

@IBDesignable
class FloatingLabelTextField: UIView {
    @IBOutlet weak var TextFiled: UITextField!
    @IBOutlet weak var IconImage: UIImageView!
    @IBOutlet weak var Label: UILabel!

        var labelText: String? {
            get {
                return Label.text
            }
            set {
                Label.text = newValue
            }
        }

        var placeholder: String? {
            get {
                return TextFiled.placeholder
            }
            set {
                TextFiled.placeholder = newValue
            }
        }

        var icon: UIImage? {
            get {
                return IconImage.image
            }
            set {
                IconImage.image = newValue
            }
        }

        var text: String? {
            get {
                return TextFiled.text
            }
            set {
                TextFiled.text = newValue
            }
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }

        private func commonInit() {
            let nib = UINib(nibName: "FloatingLabelTextField", bundle: nil)
            nib.instantiate(withOwner: self, options: nil)
            addSubview(IconImage)
            addSubview(Label)
            addSubview(TextFiled)

            IconImage.translatesAutoresizingMaskIntoConstraints = false
            Label.translatesAutoresizingMaskIntoConstraints = false
            TextFiled.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                IconImage.leadingAnchor.constraint(equalTo: leadingAnchor),
                IconImage.centerYAnchor.constraint(equalTo: centerYAnchor),
                IconImage.widthAnchor.constraint(equalToConstant: 24),
                IconImage.heightAnchor.constraint(equalToConstant: 24),

                Label.leadingAnchor.constraint(equalTo: IconImage.trailingAnchor, constant: 8),
                Label.centerYAnchor.constraint(equalTo: centerYAnchor),

                TextFiled.leadingAnchor.constraint(equalTo: leadingAnchor),
                TextFiled.trailingAnchor.constraint(equalTo: trailingAnchor),
                TextFiled.topAnchor.constraint(equalTo: topAnchor),
                TextFiled.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    }
