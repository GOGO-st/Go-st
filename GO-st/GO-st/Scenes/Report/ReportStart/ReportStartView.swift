//
//  ReportStartView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/06.
//

import UIKit
import Then
import SnapKit

final class ReportStartView: UIView {
    
    private let fixLabel = UILabel().then {
        $0.text = "내가 갔던 장소는 바로 여기!"
        $0.font = R.font.notoSansKRBold(size: 16)
    }
    
    // 나중에 검색뷰 다른 곳에도 생기면 분리하기
    let searchTextField = CustomTextField().then {
        $0.placeholder = "장소를 입력해주세요"
        $0.layer.cornerRadius = 8
    }
    
    let rightButton = UIButton().then {
        $0.setImage(R.image.icon.icSearch(), for: .normal)
        $0.setImage(R.image.icon.icX(), for: .selected)
    }
    
    let searchTableView = UITableView().then {
        $0.backgroundColor = R.color.darkGrey()
    }
    
    let testButton = UIButton().then {
        $0.backgroundColor = .blue
        $0.setTitle("다음", for: .normal)
    }
    
    private let WIDTH: CGFloat = UIScreen.main.bounds.width
    private let HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    var buttonIsSelected: Bool = true
    var placeResult: String?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addContentView()
        self.setAutoLayout()
        self.setButton()
        self.searchTextField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addContentView() {
        self.addSubview(fixLabel)
        self.addSubview(searchTextField)
        self.addSubview(rightButton)
        self.addSubview(searchTableView)
//        self.addSubview(testButton)
    }
    
    private func setAutoLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(self.WIDTH)
            $0.height.equalTo(self.HEIGHT)
        }
        // 내가 갔던
        fixLabel.snp.makeConstraints {
            $0.top.equalTo(self).offset(42)
            $0.left.equalTo(self).offset(20)
        }
        // 검색창
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(fixLabel.snp.bottom).offset(24)
            $0.left.equalTo(self).offset(20)
            $0.right.equalTo(self).offset(-20)
            $0.height.equalTo(44)
        }
        // 검색 버튼
        rightButton.snp.makeConstraints {
            $0.centerY.equalTo(searchTextField)
            $0.right.equalTo(searchTextField.snp.right).offset(-19)
            $0.width.height.equalTo(18)
        }
        searchTableView.snp.makeConstraints {
            $0.top.equalTo(rightButton.snp.bottom).offset(32)
            $0.left.right.bottom.equalTo(self)
        }
//        testButton.snp.makeConstraints {
//            $0.top.equalTo(fixLabel.snp.bottom).offset(90)
//            $0.centerX.equalToSuperview()
//        }
    }
    func delete(){
        searchTextField.text = ""
    }
    
    // 여기부터
    func setButton() {
        rightButton.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
    }
    func search(_ place: String){
        print("search~!")
        // 서버 연결
//        DispatchQueue.main.async {
//            self.searchTableView.reloadData()
//        }
    }
    
    @objc
    func rightButtonClicked(_ sender: UIButton){
        placeResult = searchTextField.text
        sender.isSelected ? delete() : search(placeResult ?? "")
        sender.isSelected.toggle()
    }
    // 여기까지는 ViewController에 넣어야겠음
}
extension ReportStartView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let str = textField.text
        if str?.count != 0 {
            searchTextField.resignFirstResponder()
            search(str ?? "")
        }
        return true
    }
 
}
