//
//  CustomTabBar.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/26.
//

import UIKit
import Then
import SnapKit

protocol PagingTabbarDelegate {
    func scrollToIndex(to index: Int)
}

class CustomTabBar: UIView {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.register(CustomTabBarCell.self, forCellWithReuseIdentifier: CustomTabBarCell.identifier)
    }
    
    private let WIDTH = UIScreen.main.bounds.width
    private let HEIGHT = 29
    
    private let tabTypes = ["내가 쓴 흔적", "내가 찜한 장소"]
    
    var delegate: PagingTabbarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        setAutoLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.backgroundColor = R.color.background()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(collectionView)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        collectionView.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(self)
        }
    }
}
extension CustomTabBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTabBarCell.identifier, for: indexPath) as? CustomTabBarCell else {
            return UICollectionViewCell()
        }
        cell.tabLabel.text = self.tabTypes[indexPath.row]
        return cell
    }
    
    
}
extension CustomTabBar: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.frame.height
        let cellWidth = collectionView.frame.width / 2
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
extension CustomTabBar: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.scrollToIndex(to: indexPath.row)
        print(indexPath.row)
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomTabBarCell {
            cell.activate()
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomTabBarCell {
            cell.deactivate()
        }
    }
}
