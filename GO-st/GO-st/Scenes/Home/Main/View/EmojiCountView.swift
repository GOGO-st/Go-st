//
//  EmojiCountView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/25.
//

import UIKit
import Then
import SnapKit


class EmojiCountView: UIView {
    
    private let firstEmoji = EmojiView()
    private let secondEmoji = EmojiView()
    private let thirdEmoji = EmojiView()
    
    // 새로 뷰를 팔지 고민
    private lazy var countView = UIView().then {
        $0.backgroundColor = R.color.darkGrey()
        $0.layer.borderWidth = 1
        $0.layer.borderColor = R.color.background()?.cgColor
        $0.layer.cornerRadius = HEIGHT / 2
    }
    
    private let countLabel = UILabel().then {
        $0.font = R.font.notoSansKRBold(size: 12)
        $0.textColor = R.color.point()
        $0.text = "+32"
    }
    
    private let WIDTH: CGFloat = 118
    private let HEIGHT: CGFloat = 32
    
    init() {
        super.init(frame: .zero)
        self.addContentView()
        self.setAutoLayout()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(firstEmoji)
        self.addSubview(secondEmoji)
        self.addSubview(thirdEmoji)
        self.addSubview(countView)
        countView.addSubview(countLabel)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
//            $0.width.equalTo(WIDTH)
            $0.height.equalTo(HEIGHT)
        }
        firstEmoji.snp.makeConstraints {
            $0.top.left.bottom.equalTo(self)
        }
        secondEmoji.snp.makeConstraints {
            $0.top.bottom.equalTo(self)
            $0.left.equalTo(firstEmoji.snp.right).offset(-10)
        }
        thirdEmoji.snp.makeConstraints {
            $0.top.bottom.equalTo(self)
            $0.left.equalTo(secondEmoji.snp.right).offset(-10)
            $0.right.equalTo(countView.snp.left).offset(-6)
        }
        countView.snp.makeConstraints {
            $0.top.right.bottom.equalTo(self)
            // 카운트레이블 길이만큼 늘어나게 하기
            $0.width.equalTo(33)
        }
        countLabel.snp.makeConstraints {
            $0.center.equalTo(countView)
        }
    }
    
    func bindEmoji(_ emojis: [String]) {
        firstEmoji.setEmoji(emojis[0])
        secondEmoji.setEmoji(emojis[1])
        thirdEmoji.setEmoji(emojis[2])
    }
    
    func bindCount(_ count: String) {
        countLabel.text = "+\(count)"
    }
}
