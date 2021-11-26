//
//  ReportStartViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import Then
import SnapKit

final class ReportStartViewController: UIViewController, UITextFieldDelegate {

    static let identifier = "ReportStartViewController"
    
    private let reportStartView = ReportStartView()
    private let titleView = NavigationTitleView()
    private let goToMapView = ToTheMapView()
    
    private var keyboardHeight: CGFloat = 0
    private var tabBarHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addContentView()
        self.setAutoLayout()
        
        self.titleView.setTitle("흔적 남기기")
        self.titleView.leftButton.isHidden.toggle()
        
        self.reportStartView.searchTextField.delegate = self
        self.reportStartView.testButton.addTarget(self, action: #selector(testButtonDidTap), for: .touchUpInside)
        self.goToMapView.goToTheMapButton.addTarget(self, action: #selector(goToTheMapButtonDidTap), for: .touchUpInside)
        
        self.tabBarHeight = self.tabBarController?.tabBar.frame.size.height ?? 0
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    private func addContentView() {
        view.addSubview(titleView)
        view.addSubview(reportStartView)
        view.addSubview(goToMapView)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        // 네비게이션 타이틀
        titleView.snp.makeConstraints {
            $0.top.left.right.equalTo(safeArea)
        }
        // 전체 뷰
        reportStartView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom)
            $0.left.right.bottom.equalTo(safeArea)
        }
        // 찾는 장소가 안보여요
        goToMapView.snp.makeConstraints {
            $0.bottom.equalTo(safeArea)
        }
    }
    
    @objc func testButtonDidTap() {
        self.navigationController?.pushViewController(ReportResultViewController(), animated: true)
    }
    
    // 지도에서 찾을래요
    @objc func goToTheMapButtonDidTap() {
        self.navigationController?.pushViewController(SearchOnTheMapViewController(), animated: true)
    }
    
    // keyboard 올라오면 goToMapView y 위치 바꾸기
    @objc func keyboardWillShow(_ sender: Notification) {
        
        // 키보드 높이 구하기
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
        }
        
        // goToMapView y 위치 바꾸기
        goToMapView.setFrame(self.view.frame.height - keyboardHeight - goToMapView.frame.height)
    }
    
    // keyboard 사라지면 goToMapView y 위치 바꾸기
    @objc func keyboardWillHide(_ sender: Notification) {
        goToMapView.setFrame(self.view.frame.height - tabBarHeight - goToMapView.frame.height)
    }
    
    // return 버튼 누르면 키보드 내려가기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        reportStartView.searchTextField.resignFirstResponder()
        return true
    }

}
