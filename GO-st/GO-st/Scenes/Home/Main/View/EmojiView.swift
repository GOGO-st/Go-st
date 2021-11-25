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
    init(emoji: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 33, height: 32))
        
        self.backgroundColor = R.color.background()
        self.layer.borderWidth = 1
        self.layer.borderColor = R.color.darkGrey()?.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        
        self.emojiLabel.text = emoji
        
        self.addSubview(emojiLabel)
        
        emojiLabel.snp.makeConstraints {
            $0.center.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
