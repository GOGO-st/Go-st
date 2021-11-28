//
//  ReportResultView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

final class ReportResultView: ReportView {
    
//    private let placeNameLabel = LabelTextFieldView().then {
//        $0.titleLabel.text = "장소 이름"
//        $0.contentTextField.backgroundColor = R.color.background()
//    }
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = R.color.background()
        self.addContentView()
        self.setAutoLayout()
        
        
//        placeNameLabel.contentTextField.delegate = self
//        super.title.contentTextField.delegate = self
//        super.descriptionTextView.delegate = self
//        super.emojiTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
//        addSubview(placeNameLabel)
    }
    
    private func setAutoLayout() {
//        self.snp.makeConstraints {
//            $0.width.equalTo(self.WIDTH)
//            $0.height.equalTo(self.HEIGHT)
//        }
//        placeNameLabel.snp.makeConstraints {
//            $0.top.equalTo(super.location.snp.bottom).offset(20)
//            $0.left.equalTo(self).offset(24)
//            $0.right.equalTo(self).offset(-24)
//        }
    }
    
//    func setAddress(_ address: String) {
//        super.location.contentLabel.text = address
//    }
}
//extension ReportResultView: UITextFieldDelegate {
//    // 아무데나 누르면 키보드 내려가기
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
//        super.touchesBegan(touches, with: event)
//        self.endEditing(true)
//    }
//    // return 누르면 키보드 내려가기
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        switch textField {
//            case placeNameLabel.contentTextField:
//                super.title.contentTextField.becomeFirstResponder()
//            case super.title.contentTextField:
//                super.emojiTextField.resignFirstResponder()
////                super.descriptionTextView.becomeFirstResponder()
////            case super.descriptionTextView:
////                super.emojiTextField.resignFirstResponder()
//            default:
//                textField.resignFirstResponder()
//        }
//        return true
//    }
//}
