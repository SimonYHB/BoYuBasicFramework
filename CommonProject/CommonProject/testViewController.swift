//
//  testViewController.swift
//  CommonProject
//
//  Created by 生生 on 2017/9/19.
//  Copyright © 2017年 yhb. All rights reserved.
//

import UIKit
import PKHUD

class testViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        HUD.show(.progress)
        HUD.customShow()
//        HUD.hide()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
