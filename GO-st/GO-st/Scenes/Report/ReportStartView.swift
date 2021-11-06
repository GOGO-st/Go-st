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
    
    let testLabel = UILabel().then {
        $0.text = "ReportViewController"
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
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(testLabel)
        self.addSubview(testButton)
        
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        testLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        testButton.snp.makeConstraints {
            $0.top.equalTo(testLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
}
