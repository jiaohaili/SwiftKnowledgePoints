//
//  StackUselistController.swift
//  SwiftKnowledgePoints
//
//  Created by haili on 2022/3/27.
//


/**
 参考：
 UIStackView 的各种使用案例
 https://www.jianshu.com/p/371c49d8bd64
 */

import UIKit

class StackUselistController: UIViewController {
    
    

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 270
        tableView.register(StackUseCell.self, forCellReuseIdentifier: StackUseCell.description())
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(StackUseCell.description())
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        
        self.tableView.reloadData()
    }
    

}

extension StackUselistController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StackUseCell.description(), for: indexPath) as! StackUseCell
//        if indexPath.row == 0 {
            cell.setHiddenViewWith(index: indexPath.row)
//        }
        return cell
    }
}
