//
//  BaseTabBarController.swift
//  WorkSpace
//
//  Created by 生生 on 2017/8/10.
//  Copyright © 2017年 生生. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class BaseTabBarController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
//        
//        let v1 = GZTDataViewController()
//        let v2 = GZTMessageViewController()
//        let v3 = GZTMineViewController()
//        
//        v1.tabBarItem = ESTabBarItem.init(title: "数据", image: UIImage(named: "account_weixindengru"), selectedImage: UIImage(named: "account_weixindengru"))
//        v2.tabBarItem = ESTabBarItem.init(title: "消息", image: UIImage(named: "account_weixindengru"), selectedImage: UIImage(named: "account_weixindengru"))
//        v3.tabBarItem = ESTabBarItem.init(title: "我的", image: UIImage(named: "account_weixindengru"), selectedImage: UIImage(named: "account_weixindengru"))
//      
//        let n1 = BaseNavigationViewController.init(rootViewController: v1)
//        let n2 = BaseNavigationViewController.init(rootViewController: v2)
//        let n3 = BaseNavigationViewController.init(rootViewController: v3)
//        
//        self.viewControllers = [n1, n2, n3]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
