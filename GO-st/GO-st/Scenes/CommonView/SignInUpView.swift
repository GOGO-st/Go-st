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
        $0.backgroundColor = UIColor(white: 1, alpha: 0.08)
    }
    
    // 단계 바
    let stepBar = UIView().then {
        $0.backgroundColor = R.color.point()
    }
    
    // 다음 버튼
    let nextButton = FinishedButton(title: "인증하기", type: .signUp)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = R.color.background()
        
        self.addContentView()
        self.setAutoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private func addContentView() {
        self.addSubview(baseBar)
        baseBar.addSubview(stepBar)
        self.addSubview(nextButton)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(CommonValue.shared.WIDTH)
            $0.height.equalTo(CommonValue.shared.HEIGHT)
        }
        baseBar.snp.makeConstraints {
            $0.top.left.right.equalTo(self)
            $0.height.equalTo(2)
        }
        stepBar.snp.makeConstraints {
            $0.top.left.bottom.equalTo(baseBar)
//            $0.width.equalTo(self.WIDTH / 3)
        }
    }
    
    func canIUseNextButton(_ answer: Bool) {
        if answer == true {
            self.nextButton.activate()
        } else {
            self.nextButton.deactivate()
        }
    }
    
}
