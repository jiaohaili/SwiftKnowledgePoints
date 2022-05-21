//
//  StackUseCell.swift
//  SwiftKnowledgePoints
//
//  Created by haili on 2022/3/27.
//

import UIKit
import SnapKit

class StackUseCell: UITableViewCell {

    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 40, height: 40))
        }
        return view
    }()
    private lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        view.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 60, height: 60))
        }
        return view
    }()
    private lazy var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        view.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 90, height: 90))
        }
        return view
    }()
    private lazy var stackView: UIStackView = {
        let stackView  = UIStackView.init(arrangedSubviews: [redView, yellowView, blueView])
        // item间距
        stackView.spacing = 30
        // 水平方向布局
        stackView.axis = .horizontal
        // 底部对齐
        stackView.alignment = .bottom
        // 等间距
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = UIColor.gray
        return stackView
    }()
    
    //----------------------------------------------------------------
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "top label 长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 0
        label.backgroundColor = .green
        return label
    }()
    private lazy var midLabel: UILabel = {
        let label = UILabel()
        label.text = "短label"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 0
        label.backgroundColor = .orange
        return label
    }()
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "短label"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 0
        label.isHidden = true
        label.backgroundColor = .purple
        return label
    }()
    private lazy var stackLabelView: UIStackView = {
        let stackView  = UIStackView.init(arrangedSubviews: [topLabel, midLabel, bottomLabel])
        // item间距
        stackView.spacing = 8
        // 水平方向布局
        stackView.axis = .vertical
        // 底部对齐
        stackView.alignment = .leading
        // 等间距
        stackView.distribution = .fill
        stackView.backgroundColor = UIColor.gray
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.top.equalTo(20)
            make.height.equalTo(100)
        }
        self.contentView.addSubview(stackLabelView)
        stackLabelView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
    }
    
    func setHiddenViewWith(index: NSInteger) {
        let num = index % 3
        if (num == 0) {
            yellowView.isHidden = true
        } else if (num == 1) {
            redView.isHidden = true
        } else if (num == 2) {
            blueView.isHidden = true
        }
    }
    
    // 必要初始化器，情况一般会出现在继承了遵守NSCoding protocol的类
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //单元格被重用，因此，如果要重置某些属性（例如单元格的背景），可以在此处进行操作
    override func prepareForReuse() {
        super.prepareForReuse()
        yellowView.isHidden = false
        redView.isHidden = false
        blueView.isHidden = false
    }
    
    
    
}
