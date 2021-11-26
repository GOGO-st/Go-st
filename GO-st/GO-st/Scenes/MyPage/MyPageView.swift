//
//  MyPageView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/20.
//

import UIKit
import Then
import SnapKit

class MyPageView: UIView {
    
    // attribute
    private let nickNameLabel = UILabel().then {
        $0.text = ""
        $0.textAlignment = .left
        $0.numberOfLines = 2
        $0.textColor = .white
    }
    
    private let customTabBar = CustomTabBar()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.showsHorizontalScrollIndicator = false
        $0.isPagingEnabled = true
        $0.isScrollEnabled = false
        $0.register(ContentsCollectionViewCell.self, forCellWithReuseIdentifier: ContentsCollectionViewCell.identifier)
    }
    
    // 임시
    private let tabTypes = ["내가 쓴 흔적", "내가 찜한 장소"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addContentView()
        setAutoLayout()
        customTabBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(nickNameLabel)
        self.addSubview(customTabBar)
        self.addSubview(collectionView)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(CommonValue.shared.WIDTH)
            $0.height.equalTo(CommonValue.shared.HEIGHT)
        }
        nickNameLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(100)
            $0.left.equalTo(self).offset(24)
        }
        customTabBar.snp.makeConstraints {
            $0.top.equalTo(nickNameLabel.snp.bottom).offset(27)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(customTabBar.snp.bottom)
            $0.left.right.bottom.equalTo(self)
        }
    }
    
    func setNickName(_ nick: String) {
        self.nickNameLabel.attributedText = NSMutableAttributedString().regular("안녕하세요\n", fontSize: 24)
                                    .bold(nick, fontSize: 24)
                                    .regular("님", fontSize: 24)
    }
}
extension MyPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentsCollectionViewCell.identifier, for: indexPath) as? ContentsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setCell(ListType.asArray[indexPath.row])
        return cell
    }
    
    
}
extension MyPageView: PagingTabbarDelegate {
    // 탭바를 클릭했을 때, 콘텐츠 뷰 이동
    func scrollToIndex(to index: Int) {
        print("hi contents \(self.tabTypes[index])")
        collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
    }
}
extension MyPageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(collectionView.frame.height, collectionView.frame.width)
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
