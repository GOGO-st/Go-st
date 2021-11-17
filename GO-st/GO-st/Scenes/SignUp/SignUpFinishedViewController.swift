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
    
    private let descriptionLabel = UILabel().then {
        $0.text = "회원가입 완료!"
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 20)
    }
    
    private let nextButton = FinishedButton(title: "만나러 가기").then {
        $0.activate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        self.addContentView()
        self.setAutoLayout()
        
        self.nextButton.addTarget(self, action: #selector(nextButtonDidTap), for: .touchUpInside)
    }
    
    private func addContentView() {
        view.addSubview(descriptionLabel)
        view.addSubview(nextButton)
    }
    
    private func setAutoLayout() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        descriptionLabel.snp.makeConstraints {
            $0.center.equalTo(safeArea)
        }
    }
    
    @objc
    private func nextButtonDidTap() {
        self.navigationController?.pushViewController(TabBarViewController(), animated: false)
    }
}
