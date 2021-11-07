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
    
    private let nextButton = UIButton().then {
        $0.backgroundColor = .orange
        $0.setTitle("만나러가기", for: .normal)
        $0.tintColor = .black
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
        nextButton.snp.makeConstraints {
            $0.left.equalTo(safeArea).offset(20)
            $0.right.equalTo(safeArea).offset(-20)
            $0.bottom.equalTo(safeArea).offset(-50)
        }
    }
    
    @objc private func nextButtonDidTap() {
        self.navigationController?.pushViewController(TabBarViewController(), animated: false)
    }
}
