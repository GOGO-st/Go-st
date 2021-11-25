//
//  StartView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/25.
//

import UIKit
import Then
import SnapKit

final class StartView: UIView {
    
    let logo = UIImageView().then {
        $0.image = R.image.logo.imgLogo()
        $0.contentMode = .scaleAspectFill
    }
    
    let title = UILabel().then {
        $0.text = "서로가 유령처럼 느껴지는\n대학생들의 흔적 찾기"
        $0.textAlignment = .left
        $0.numberOfLines = 2
        $0.font = R.font.notoSansKRMedium(size: 24)
        $0.textColor = .white
    }
    
    let subTitle = UILabel().then {
        $0.text = "대학 근처 위치 기반의 경험 공유 커뮤니티"
        $0.textAlignment = .left
        $0.font = R.font.notoSansKRRegular(size: 12)
        $0.textColor = UIColor(white: 1, alpha: 0.38)
    }
    
    let loginButton = FinishedButton(title: "로그인", type: .login).then {
        $0.activate()
    }
    
    let signUpLabel = UILabel().then {
        $0.textColor = .white
        $0.attributedText = NSMutableAttributedString()
            .regular("처음이신가요? ", fontSize: 14)
            .bold("회원가입", fontSize: 14)
    }
    
    let signUpButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    
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
        self.addSubview(logo)
        self.addSubview(title)
        self.addSubview(subTitle)
        self.addSubview(loginButton)
        self.addSubview(signUpLabel)
        self.addSubview(signUpButton)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(CommonValue.shared.WIDTH)
            $0.height.equalTo(CommonValue.shared.HEIGHT)
        }
        logo.snp.makeConstraints {
            $0.top.equalTo(self).offset(99)
            $0.left.equalTo(self).offset(26)
        }
        title.snp.makeConstraints {
            $0.top.equalTo(logo.snp.bottom).offset(60)
            $0.left.equalTo(self).offset(26)
        }
        subTitle.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(16)
            $0.left.equalTo(self).offset(26)
        }
        
        signUpLabel.snp.makeConstraints {
            $0.bottom.equalTo(self).offset(-48)
            $0.centerX.equalTo(self)
        }
        
        signUpButton.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(signUpLabel)
        }
    }
}
