//
//  OTPTextField.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/08.
//

import UIKit
import Then
import SnapKit

class OTPTextField: UITextField {
    
    var didEnterLastDigit: ((String) -> Void)?
    
    var defaultCharacter = "?"
    private var isConfigured = false // configure함수 한번만 호출하기 위함

    private var digitLabels = [UILabel]()
    
    // tap하면 키보드 올라옴
    private lazy var tapRecognizer = UITapGestureRecognizer().then {
        $0.addTarget(self, action: #selector(becomeFirstResponder))
    }
    
    // 인증번호 자릿수
    func configure(with slotCount: Int = 6) {
        guard isConfigured == false else { return }
        isConfigured.toggle() // false -> true
        
        configureTextField()
        
        let labelsStackView = createLabelsStackView(with: slotCount)
        addSubview(labelsStackView)
        
        addGestureRecognizer(tapRecognizer)
        
        labelsStackView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(self)
        }
    }
    
    // textfield 설정
    private func configureTextField() {
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        delegate = self
    }
    
    // 스택뷰
    private func createLabelsStackView(with count: Int) -> UIStackView {
        let stackView = UIStackView().then {
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 8
        }
        
        for _ in 1...count {
            let label = UILabel().then {
                $0.textAlignment = .center
                $0.font = R.font.notoSansKRRegular(size: 28)
                $0.textColor = UIColor(white: 1, alpha: 0.58)
                $0.isUserInteractionEnabled = true
                $0.text = defaultCharacter
                
                $0.backgroundColor = R.color.semiBlack()
                $0.layer.borderColor = R.color.semiBlack()?.cgColor
                $0.layer.borderWidth = 1
                $0.layer.cornerRadius = 4
            }
            stackView.addArrangedSubview(label)
            digitLabels.append(label)
        }
        return stackView
    }
    
    @objc
    private func textDidChange() {
        guard let text = self.text, text.count <= digitLabels.count else { return }
        
        for i in 0..<digitLabels.count {
            let currentLabel = digitLabels[i]
            
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
                currentLabel.textColor = R.color.point()
                currentLabel.layer.borderColor = R.color.point()?.cgColor
            } else {
                currentLabel.text = defaultCharacter
                currentLabel.textColor = .gray
                currentLabel.layer.borderColor = R.color.semiBlack()?.cgColor
            }
        }
        
        if text.count == digitLabels.count {
            didEnterLastDigit?(text)
        }
    }
    
    
}

extension OTPTextField: UITextFieldDelegate {
    
    // 넘치는 숫자 처리
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let characterCount = textField.text?.count else { return false }
        return characterCount < digitLabels.count || string == ""
    }
    
}
