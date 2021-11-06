//
//  ReportStartView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/06.
//

import UIKit
import Then
import SnapKit

final class ReportStartView: UIView {
    
    private let fixLabel = UILabel().then {
        $0.text = "내가 갔던 장소는 바로 여기!"
    }
    
    // 나중에 검색뷰 다른 곳에도 생기면 분리하기
    private let searchTextField = UITextField().then {
        $0.placeholder = "장소를 입력해주세요"
    }
    
    
    
    let testButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("다음", for: .normal)
    }
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addContentView()
        self.setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(fixLabel)
        self.addSubview(testButton)
        self.addSubview(searchTextField)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        // 내가 갔던
        fixLabel.snp.makeConstraints {
            $0.top.left.equalTo(self).offset(20)
        }
        // 검색창
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(fixLabel.snp.bottom).offset(10)
            $0.left.equalTo(self).offset(20)
            $0.right.equalTo(self).offset(-20)
        }
        
        
        
        
        testButton.snp.makeConstraints {
            $0.top.equalTo(fixLabel.snp.bottom).offset(90)
            $0.centerX.equalToSuperview()
        }
        
    }
}
