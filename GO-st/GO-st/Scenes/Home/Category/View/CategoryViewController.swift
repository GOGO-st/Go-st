//
//  CategoryViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import SnapKit

final class CategoryViewController: UIViewController {
    
    let categoryView = CategoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(categoryView)
        
        categoryView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.categoryView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        self.categoryView.collectionView.delegate = self
    }
    
    @objc private func backButtonDidTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HomeCategoryCollectionViewCell {
            cell.selected()
            self.dismiss(animated: true, completion: nil)
        }
    }
}
extension CategoryViewController: UICollectionViewDelegateFlowLayout {
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
