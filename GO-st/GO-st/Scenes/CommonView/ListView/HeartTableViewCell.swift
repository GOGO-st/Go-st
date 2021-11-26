//
//  HeartTableViewCell.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/26.
//

import UIKit
import Then
import SnapKit

class HeartTableViewCell: UITableViewCell {
    
    static let identifier = "HeartTableViewCell"
    
//    private let background = UIView().then {
//        $0.layer.cornerRadius = 8
//        $0.backgroundColor = R.color.darkGrey()
//    }
    
    private let storeInfoHeartCardView = StoreInfoHeartCardView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addContentView()
        self.setAutoLayout()
        self.setCellStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(storeInfoHeartCardView)
        
    }
    
    private func setAutoLayout() {
        
//        background.snp.makeConstraints {
//            $0.top.equalTo(self)//.offset(16)
//            $0.left.equalTo(self).offset(20)
//            $0.right.equalTo(self).offset(-20)
//            $0.bottom.equalTo(self).offset(-23)
//        }
        storeInfoHeartCardView.snp.makeConstraints {
            $0.top.equalTo(self)//.offset(16)
            $0.left.equalTo(self).offset(14)
            $0.right.equalTo(self).offset(-14)
            $0.bottom.equalTo(self).offset(-16)
        }
    }
    
    private func setCellStyle() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    func bind() {
        // 나중에 struct 받아서 bind
        storeInfoHeartCardView.storeLabel.text = "마눌린"
        storeInfoHeartCardView.addressLabel.text = "서울시 성북구 화랑로13길 38"
        storeInfoHeartCardView.countView.bindEmoji(["😍","😆","😅"])
    }
}
//
