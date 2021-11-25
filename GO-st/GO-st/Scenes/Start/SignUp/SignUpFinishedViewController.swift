//
//  SignUpFinishedViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/07.
//

import UIKit
import Then
import SnapKit

final class SignUpFinishedViewController: UIViewController {
    
    static let identifier = "SignUpFinishedViewController"
    
    private let finishedLabel = UILabel().then {
        $0.text = "환영합니다!"
        $0.textColor = .white
        $0.font = R.font.notoSansKRBold(size: 24)
        $0.textAlignment = .center
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = ""
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 3
    }
    
    private let nextButton = FinishedButton(title: "만나러 가기", type: .login).then {
        $0.activate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = R.color.background()
        
        self.addContentView()
        self.setAutoLayout()
        
        self.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
        
        self.setNickName("상큼한 혼밥러")
    }
    
    private func addContentView() {
        view.addSubview(finishedLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(nextButton)
    }
    
    private func setAutoLayout() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        finishedLabel.snp.makeConstraints {
            $0.center.equalTo(safeArea)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalTo(safeArea)
            $0.top.equalTo(finishedLabel.snp.bottom).offset(36)
        }
    }
    
    private func setNickName(_ nickName: String) {
        let attributString = NSMutableAttributedString()
            .bold("\(nickName)님", fontSize: 14)
            .regular("\n학교 유령들이 남긴 흔적들을", fontSize: 14)
            .regular("\n만날 준비 되셨나요?", fontSize: 14)
        
        self.descriptionLabel.attributedText = attributString
    }
    @objc
    private func nextButtonDidTap() {
        self.navigationController?.pushViewController(TabBarViewController(), animated: false)
    }
}
