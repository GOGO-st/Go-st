//
//  EmojiView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/25.
//

import UIKit
import Then
import SnapKit


class EmojiView: UIView {
    
    private let emojiLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.textAlignment = .center
    }
    
    private let WIDTH: CGFloat = 33
    private let HEIGHT: CGFloat = 32
    
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = R.color.background()
        self.layer.borderWidth = 1
        self.layer.borderColor = R.color.darkGrey()?.cgColor
        self.layer.cornerRadius = HEIGHT / 2
        
        self.addSubview(emojiLabel)
        
        self.snp.makeConstraints {
            $0.width.equalTo(WIDTH)
            $0.height.equalTo(HEIGHT)
        }
        emojiLabel.snp.makeConstraints {
            $0.center.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setEmoji(_ emoji: String) {
        self.emojiLabel.text = emoji
    }
}
