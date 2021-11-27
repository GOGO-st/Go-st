//
//  ListView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/26.
//

import UIKit
import Then
import SnapKit

public enum ListType: String, CaseIterable {
    case myReport = "흔적을 남기셨어요!"
    case myHeart = "장소를 찜했어요!"
    case report = "흔적이 있습니다"
    
    static var asArray: [ListType] {
        return self.allCases
    }
}

// 흔적, 찜 상위 클래스
class ListView: UIView {

    // 총 ~개의
    private let countLabel = UILabel().then {
        $0.text = "총 개의 "
        $0.font = R.font.notoSansKRBold(size: 14)
    }
    
    //
    private let secondLabel = UILabel().then {
        $0.text = ListType.myReport.rawValue
        $0.font = R.font.notoSansKRBold(size: 14)
    }
    
    // 이ㅁh지 카운트 뷰
    let emojiCountView = EmojiCountView().then {
        $0.isHidden = true
        $0.bindEmoji(["👀","🥰","😅"])
        $0.bindCount("11")
    }
    
    // 테이블뷰
    let tableView = UITableView().then {
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = R.color.background()
    }

    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = R.color.background()
        
        self.addContentView()
        self.setAutoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private func addContentView() {
        self.addSubview(countLabel)
        self.addSubview(secondLabel)
        self.addSubview(emojiCountView)
        self.addSubview(tableView)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(CommonValue.shared.WIDTH)
            $0.height.equalTo(CommonValue.shared.HEIGHT)
        }
        countLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(29)
            $0.left.equalTo(self).offset(24)
        }
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.top)
            $0.left.equalTo(countLabel.snp.right)
        }
        emojiCountView.snp.makeConstraints {
            $0.centerY.equalTo(secondLabel)
            $0.right.equalTo(-31)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(countLabel.snp.bottom).offset(24)
            $0.left.right.bottom.equalTo(self)
        }
    }
    
    func setCount(_ count: Int) {
        // attributedText 설정"총 개의 "
        let string = NSMutableAttributedString(string: "총 \(count)개의 ")
        string.addAttribute(.foregroundColor, value: R.color.point(), range: ("총 \(count)개의" as NSString).range(of:"\(count)"))
        self.countLabel.attributedText = string
    }
    
    func setLabel(type: ListType) {
        self.secondLabel.text = type.rawValue
    }
}
