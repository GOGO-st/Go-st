//
//  ReportResultViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/06.
//

import UIKit
import Then
import SnapKit

final class ReportResultViewController: UIViewController {

    static let identifier = "ReportResultViewController"
    
    private let titleView = NavigationTitleView().then {
        $0.leftButton.isHidden = false
        $0.setTitle("흔적 남기기")
        $0.backgroundColor = R.color.darkGrey()
    }
    
//    private let reportView = ReportResultView()
    let reportView = ReportView().then {
        $0.setType(type: .mapReport)
    }
    
    let categoryViewModel = CategoryViewModel()
    var selectedCategory = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("여기 흔적남기기 디테일 뷰")
        addContentView()
        setAutoLayout()
        
        titleView.leftButton.addTarget(self, action: #selector(leftButtonDidTap), for: .touchUpInside)
        
        reportView.placeName.contentTextField.delegate = self
        reportView.title.contentTextField.delegate = self
        reportView.emojiTextField.delegate = self
        
        reportView.categoryCollectionView.dataSource = self
        reportView.categoryCollectionView.delegate = self
        
        reportView.title.contentTextField.addTarget(self, action: #selector(activate), for: .editingChanged)
        reportView.title.contentTextField.addTarget(self, action: #selector(deactivate), for: .editingDidEnd)
        reportView.categoryButton.addTarget(self, action: #selector(categoryButtonDidTap), for: .touchUpInside)
        
    }
    private func addContentView() {
        view.addSubview(titleView)
        view.addSubview(reportView)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        // 네비게이션 타이틀
        titleView.snp.makeConstraints {
            $0.top.left.right.equalTo(safeArea)
        }
        
        reportView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.left.right.bottom.equalTo(safeArea)
        }
    }
    
    func bind(_ address: String) {
        reportView.setAddress(address)
    }
    
    @objc // 이전뷰로 돌아가기
    private func leftButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc // textField 테두리 색
    private func activate() {
        self.reportView.title.activate()
    }
    
    @objc // textField 테두리 색
    private func deactivate() {
        self.reportView.title.deactivate()
    }
    
    @objc
    private func categoryButtonDidTap() {
        let nextVC = ReviewCategoryViewController()
        nextVC.modalPresentationStyle = .overFullScreen
        nextVC.delegate = self
        self.present(nextVC, animated: true, completion: nil)
    }
}
extension ReportResultViewController: SendCategoryList {
    func sendCategoryList(_ category: [Int]) {
        print("카테고리 받아왔다 \(category)")
        self.selectedCategory = category
        reportView.categoryCollectionView.reloadData()
    }
}
extension ReportResultViewController: UITextFieldDelegate {
    
    // 아무데나 누르면 키보드 내려가기
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
//        super.touchesBegan(touches, with: event)
//        self.endEditing(true)
//    }
    // return 누르면 키보드 내려가기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
            case reportView.placeName.contentTextField:
                reportView.title.contentTextField.becomeFirstResponder()
            case reportView.title.contentTextField:
                textField.resignFirstResponder()
//                reportView.emojiTextField.resignFirstResponder()
//                super.descriptionTextView.becomeFirstResponder()
//            case super.descriptionTextView:
//                super.emojiTextField.resignFirstResponder()
            default:
                textField.resignFirstResponder()
        }
        return true
    }
}
extension ReportResultViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("여기도 안들어오니 \(selectedCategory.count)")
        return selectedCategory.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReportCategoryCollectionViewCell.identifier, for: indexPath) as? ReportCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        print("여기도 좀 들어와봐라")
        cell.bind(data: categoryViewModel.categoryList[selectedCategory[indexPath.row]])
        return cell
    }
    
}
extension ReportResultViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width: CGFloat = (collectionView.frame.width - 15 * 2) / 3
//        let height: CGFloat = (collectionView.frame.height - 24 * 4) / 5
        print("여기는?")
        return CGSize(width: 72, height: 72)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
