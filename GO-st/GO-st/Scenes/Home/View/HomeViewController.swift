//
//  HomeViewController.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
import NMapsMap
import Then
import SnapKit

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    
    static let identifier = "HomeViewController"
    let viewModel = HomeViewModel()
    
    // 지도
    let mapView = NMFMapView()
    
    // 가보자고
    private let goView = UIView().then {
        $0.backgroundColor = .systemIndigo
    }
    
    private let goLabel = UILabel().then {
        $0.text = "어디 한 번 가보자고"
    }
    
    private let goButton = UIButton().then {
        $0.backgroundColor = .clear
    }
    
    // 가게 재검색
    private let retrieveButton = UIButton().then {
        $0.backgroundColor = .darkGray
        $0.setTitle("현재 지도에서 가게 재검색", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.isHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addContentView()
        setAutoLayout()
        setNaverMap()
        
        retrieveButton.isHidden = true
        retrieveButton.addTarget(self, action: #selector(retrieveButtonTapped), for: .touchUpInside)
    }
    
    

}

// MARK: - UI 설정
extension HomeViewController {
    private func addContentView() {
        // 지도
        view.addSubview(mapView)
        
        // 가보자고
        view.addSubview(goView)
        goView.addSubview(goLabel)
        goView.addSubview(goButton)
        
        // 가게 재검색
        view.addSubview(retrieveButton)
    }
    
    private func setAutoLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        // 지도
        mapView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.bottom.equalTo(safeArea)
        }
        
        // 가보자고
        goView.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(50)
            $0.left.equalTo(safeArea).offset(20)
            $0.right.equalTo(safeArea).offset(-20)
            $0.height.equalTo(50)
        }
        goLabel.snp.makeConstraints {
            $0.center.equalTo(goView)
        }
        goButton.snp.makeConstraints {
            $0.top.left.right.bottom.equalTo(goView)
        }
        
        // 가게 재검색
        retrieveButton.snp.makeConstraints {
            $0.top.equalTo(goView.snp.bottom).offset(10)
            $0.centerX.equalTo(safeArea)
            $0.width.equalTo(100)
        }
    }
    
    
    // 가게 재검색 뷰 숨기기
    func retrieveButtonIsHidden(_ value: Bool) {
        retrieveButton.isHidden = value
    }
    
    @objc func retrieveButtonTapped(_ sender: UIButton) {
        retrieveButton.isHidden = true
    }
}
