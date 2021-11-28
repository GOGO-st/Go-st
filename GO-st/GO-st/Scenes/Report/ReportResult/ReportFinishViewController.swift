//
//  ReportFinishViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/28.
//

import UIKit
import Then
import SnapKit

final class ReportFinishViewController: UIViewController {

    static let identifier = "ReportFinishViewController"
    
    let emojiLabel = UILabel().then {
        $0.text = "🎉"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 60)
    }
    
    let descriptionLabel = UILabel().then {
        $0.text = "새로운 흔적을 추가했어요!"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = R.font.notoSansKRBold(size: 20)
    }
    
    let finishedButton = FinishedButton(title: "추가완료", type: .report).then {
        $0.activate()
        $0.addTarget(self, action: #selector(finishedButtonDidTap), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("여기 흔적남기기 디테일 뷰")
        addContentView()
        setAutoLayout()
        
        
        
    }
    private func addContentView() {
        view.addSubview(emojiLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(finishedButton)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        emojiLabel.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(212)
            $0.centerX.equalTo(safeArea)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(emojiLabel.snp.bottom).offset(51)
            $0.centerX.equalTo(safeArea)
        }
        finishedButton.snp.makeConstraints {
            $0.left.equalTo(safeArea).offset(20)
            $0.right.equalTo(safeArea).offset(-20)
            $0.bottom.equalTo(safeArea).offset(-89)
            $0.height.equalTo(58)
        }
    }
    
    func bind(_ emoji: String) {
        emojiLabel.text = emoji
    }
    
    @objc
    private func finishedButtonDidTap() {
        self.navigationController?.popToRootViewController(animated: false)
    }
}
