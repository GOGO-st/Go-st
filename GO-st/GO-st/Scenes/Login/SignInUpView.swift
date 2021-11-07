//
//  SignInUpView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

// 로그인 / 회원가입 뷰 상위 클래스
class SignInUpView: UIView {

    // 회색 바
    private let baseBar = UIView().then {
        $0.backgroundColor = .darkGray
    }
    
    // 단계 바
    let stepBar = UIView().then {
        $0.backgroundColor = .orange
    }
    
    // 다음 버튼
    let nextButton = UIButton().then {
        $0.backgroundColor = .orange
        $0.setTitle("다음", for: .normal)
        $0.tintColor = .black
    }
    
    let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .black
        
        self.addContentView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.backgroundColor = .black
        
        self.addContentView()
        self.setAutoLayout()
    }
    
    private func addContentView() {
        self.addSubview(baseBar)
        baseBar.addSubview(stepBar)
        self.addSubview(nextButton)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        baseBar.snp.makeConstraints {
            $0.top.left.right.equalTo(self)
            $0.height.equalTo(3)
        }
        stepBar.snp.makeConstraints {
            $0.top.left.bottom.equalTo(baseBar)
//            $0.width.equalTo(self.WIDTH / 3)
        }
        nextButton.snp.makeConstraints {
            $0.left.equalTo(self).offset(20)
            $0.right.bottom.equalTo(self).offset(-20)
        }
    }
}
