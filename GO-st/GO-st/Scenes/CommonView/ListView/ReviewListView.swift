//
//  ReviewListView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/26.
//

import UIKit
import Then
import SnapKit

// 내가 쓴 흔적, 가게 상세뷰
class ReviewListView: ListView {

    var listType = ListType.myReport
    
    override init() {
        super.init()
       
        super.tableView.dataSource = self
//        self.addContentView()
//        self.setAutoLayout()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    private func addContentView() {
    }
    
    private func setAutoLayout() {
    }
    
    func setType(_ type: ListType) {
        
        self.listType = type
        
        switch listType {
            case .myReport, .report:
                super.tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.identifier)
            case .myHeart:
                super.tableView.register(HeartTableViewCell.self, forCellReuseIdentifier: HeartTableViewCell.identifier)
        }
        
        setLabel(type: type)
    }
    
}
extension ReviewListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 나중에 viewModel로
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch listType {
        case .myReport, .report:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as? ReviewTableViewCell else {
                return UITableViewCell()
            }
            
            cell.bind(type: self.listType)
            return cell
        case .myHeart:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HeartTableViewCell.identifier, for: indexPath) as? HeartTableViewCell else {
                return UITableViewCell()
            }
            
            cell.bind()
            return cell
        }
    }
    
    
    
}
