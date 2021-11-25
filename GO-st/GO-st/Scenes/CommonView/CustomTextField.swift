//
//  CustomTextField.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/25.
//

import UIKit

class CustomTextField: UITextField {
    
    // tap하면 키보드 올라옴
    private lazy var tapRecognizer = UITapGestureRecognizer().then {
        $0.addTarget(self, action: #selector(becomeFirstResponder))
    }
    
    init() {
        super.init(frame: .zero)
        
        addGestureRecognizer(tapRecognizer)
        self.backgroundColor = R.color.semiBlack()
//        self.borderStyle = .bezel
        self.layer.cornerRadius = 4
        self.layer.borderColor = R.color.semiBlack()?.cgColor
        self.layer.borderWidth = 1
        
        self.font = R.font.notoSansKRRegular(size: 14)
        self.addPadding()
        
        self.addTarget(self, action: #selector(activate), for: .editingDidBegin)
        self.addTarget(self, action: #selector(deactivate), for: .editingDidEnd)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func activate() {
        self.layer.borderColor = R.color.point()?.cgColor
    }
    
    @objc
    func deactivate() {
        self.layer.borderColor = R.color.semiBlack()?.cgColor
    }
}
