//
//  LifeCycleViewController.swift
//  SwiftKnowledgePoints
//
//  Created by haili on 2022/3/20.
//

import UIKit

/// 代理的方式反向传值
protocol LifeCycleViewControllerDelegate {
    func sendData(data: String)
}

class LifeCycleViewController: UIViewController {

    //非Optional的属性，需要在类的构造方法中完成该属性的初始化工作
    var data: String
    var delegate: LifeCycleViewControllerDelegate?
    /// Optional类型的闭包
    var closure:((String) -> Void)?
    
    init(data: String) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.data = ""
        super.init(coder: coder)
    }
    
    // 加载视图时调用的方法
    override func loadView() {
        super.loadView()
    }
    
    // 视图加载完成时调用的方法
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
    }
    
    // 将要布局子视图调用的方法
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    // 已经布局子视图时调用的方法
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // 界面将要展现时调用的方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // 界面已经展示时调用的方法
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // 界面将要消失时调用的方法
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // 界面已经消失时调用的方法
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // 析构方法
    deinit {
        
    }
    
    // 收到内存警告时调用的方法
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.sendData(data: "哈哈哈哈")
        if (self.closure != nil) {
            self.closure!("闭包传值")
        }
        self.dismiss(animated: true)
    }
}
