//
//  ViewController.swift
//  SwiftKnowledgePoints
//
//  Created by haili on 2022/3/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let copy = CopyDemo.init()
//        self.present(copy, animated: true, completion: nil)
        
        let lifeVc = LifeCycleViewController.init(data: "传递数据")
        lifeVc.delegate = self
        lifeVc.closure = {(data: String) in
            print(data)
        }
        self.present(lifeVc, animated: true, completion: nil)
        
//        let stackUselistVc = StackUselistController.init()
//        self.present(stackUselistVc, animated: true, completion: nil)
    }
}

extension ViewController: LifeCycleViewControllerDelegate {
    func sendData(data: String) {
        print(data)
    }
}

