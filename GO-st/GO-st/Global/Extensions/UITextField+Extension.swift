//
//  UITextField+Extension.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/25.
//

import UIKit

extension UITextField {
    func addPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setPlaceholderWithColor(_ string: String) {
        self.attributedPlaceholder = NSAttributedString(string: string,
                                                        attributes: [NSAttributedString.Key.foregroundColor:R.color.placeholder()])
    }
}
