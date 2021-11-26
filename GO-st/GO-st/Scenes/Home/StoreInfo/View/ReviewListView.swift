//
//  ReviewListView.swift
//  GO-st
//
//  Created by ✨EUGENE✨ on 2021/11/26.
//

import UIKit
import Then
import SnapKit

// 흔적, 찜 상위 클래스
class ReviewListView: ListView {

    
    init() {
        super.init(listType: .report)
        
        super.tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.identifier)
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
    
}
extension ReviewListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 나중에 viewModel로
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as? ReviewTableViewCell else {
            return UITableViewCell()
        }
        cell.bind()
        return cell
    }
    
    
    
}
