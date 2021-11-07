//
//  LoginNumberView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

final class LoginNumberView: UIView {
    
    private let helloLabel = UILabel().then {
        $0.text = "👀\n\n환영합니다"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 16)
        $0.numberOfLines = 3
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "입력한 이메일은 인증 과정에서만 사용해요"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 12)
    }
    
    // 이메일 적으면 이미지 갈아끼우기
//    let backgroundImage
    
    let emailTextField = UITextField().then {
        $0.placeholder = "학교 이메일을 적어주세요"
    }
    
    let finishedButton = UIButton().then {
        $0.backgroundColor = .orange
        $0.setTitle("다음", for: .normal)
        $0.tintColor = .black
    }
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        
        self.addContentView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(helloLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(emailTextField)
        self.addSubview(finishedButton)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        helloLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(70)
            $0.centerX.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(helloLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        finishedButton.snp.makeConstraints {
            $0.left.equalTo(self).offset(20)
            $0.right.bottom.equalTo(self).offset(-20)
        }
    }
}
