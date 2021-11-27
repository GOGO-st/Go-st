//
//  CategoryView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import Then
import SnapKit

final class CategoryView: UIView {
    
    let viewModel = CategoryViewModel()
    private let goLabel = UILabel().then {
        $0.text = "흔적 찾아 떠나보자고!"
        $0.textColor = .white
        $0.font = R.font.notoSansKRRegular(size: 20)
    }
    
    let backButton = UIButton().then {
        $0.setTitle("엑스", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        $0.collectionViewLayout = layout
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.register(HomeCategoryCollectionViewCell.self, forCellWithReuseIdentifier: HomeCategoryCollectionViewCell.identifier)
    }
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = R.color.semiBlack()
        self.addContentView()
        self.setAutoLayout()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    private func addContentView() {
        self.addSubview(goLabel)
        self.addSubview(backButton)
        self.addSubview(collectionView)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        goLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(68)
            $0.centerX.equalTo(self)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(80)
            $0.left.equalToSuperview().offset(20)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(goLabel.snp.bottom).offset(46)
            $0.left.equalTo(self).offset(25)
            $0.right.equalTo(self).offset(-24)
            $0.bottom.equalTo(self).offset(-57)
        }
    }
    
    
}
extension CategoryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryCollectionViewCell.identifier, for: indexPath) as? HomeCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.bind(data: viewModel.categoryList[indexPath.row])
        return cell
    }
    
    
}
extension CategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - 10 - 10) / 3
        let height: CGFloat = (collectionView.frame.height - 60) / 7
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
