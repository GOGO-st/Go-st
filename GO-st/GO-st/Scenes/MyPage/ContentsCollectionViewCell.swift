//
//  ContentsCollectionViewCell.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/26.
//

import UIKit
import Then
import SnapKit

class ContentsCollectionViewCell: UICollectionViewCell {

    static let identifier = "ContentsCollectionViewCell"
    
    private let label = UILabel().then {
        $0.text = "hi"
    }
    
    private let WIDTH = UIScreen.main.bounds.width
    private let HEIGHT = UIScreen.main.bounds.height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        setAutoLayout()
        self.backgroundColor = R.color.background()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(label)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        label.snp.makeConstraints {
            $0.center.equalTo(self)
        }
    }
    
    func setCell(_ text: String) {
        self.label.text = text
    }
}
