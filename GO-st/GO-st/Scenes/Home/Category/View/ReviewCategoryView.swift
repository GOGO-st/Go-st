//
//  ReviewCategoryView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/28.
//

import UIKit
import Then
import SnapKit

final class ReviewCategoryView: UIView {
    
    let viewModel = CategoryViewModel()
    
    private let descriptionLabel = UILabel().then {
        $0.text = "카테고리 선택"
        $0.textColor = .white
        $0.font = R.font.notoSansKRRegular(size: 16)
    }
    
    private let multipleLabel = UILabel().then {
        $0.text = "중복 선택 가능"
        $0.textColor = R.color.point()
        $0.font = R.font.notoSansKRRegular(size: 12)
    }
    
    let finishedButton = FinishedButton(title: "총 0개 선택하기", type: .signUp)
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        $0.collectionViewLayout = layout
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.register(ReviewCategoryCollectionViewCell.self, forCellWithReuseIdentifier: ReviewCategoryCollectionViewCell.identifier)
    }
    
    private var selectionCount = 0
    var selectedCategory = [Int]()
    
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addContentView()
        self.setAutoLayout()
        
        self.backgroundColor = R.color.semiBlack()
        self.layer.cornerRadius = 10
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }
    
    private func addContentView() {
        self.addSubview(descriptionLabel)
        self.addSubview(multipleLabel)
        self.addSubview(collectionView)
        self.addSubview(finishedButton)
    }
    
    private func setAutoLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(32)
            $0.left.equalTo(self).offset(24)
        }
        
        multipleLabel.snp.makeConstraints {
            $0.centerY.equalTo(descriptionLabel)
            $0.right.equalToSuperview().offset(-24)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(19)
            $0.left.equalTo(self).offset(26)
            $0.right.equalTo(self).offset(-25)
            $0.bottom.equalTo(self).offset(-140)
        }
    }
}
extension ReviewCategoryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCategoryCollectionViewCell.identifier, for: indexPath) as? ReviewCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        print("cellForItemAt에 들어옴")
        cell.bind(data: viewModel.categoryList[indexPath.row])
        return cell
    }
    
    
}
extension ReviewCategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - 16 * 4) / 5
        let height: CGFloat = (collectionView.frame.height - 24 * 4) / 5
        
        print("sizeForItemAt에 들어옴")
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension ReviewCategoryView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ReviewCategoryCollectionViewCell {
            cell.selected()
            selectedCategory.append(indexPath.row)
            selectionCount += 1
            finishedButton.changeTitle(to: "총 \(selectionCount)개 선택하기")
            finishedButton.activate()
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? ReviewCategoryCollectionViewCell {
//            cell.deselected()
//        }
//    }
}
