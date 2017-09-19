//
//  HUD+.swift
//  WorkSpace
//
//  Created by 生生 on 2017/8/18.
//  Copyright © 2017年 生生. All rights reserved.
//

import PKHUD

let afterDelay = 1.00
extension HUD {
    public static func flash(_ content: HUDContentType, onView view: UIView? = nil) {
        HUD.show(content, onView: view)
        HUD.hide(afterDelay: afterDelay, completion: nil)
    }
    
 
    public static func customShow() {
        let view = UIImageView()
        view.frame = {
            let frme = CGRect.init(x: 0, y: 0, w: 150, h: 150)
            return frme
        }()
        view.backgroundColor = UIColor.white
        view.animationDuration = 1

        
        var animationImages:Array<UIImage> = []
        for i in 1...6 {
            let imageName = String.init(format: "loading_0%d", i)
            let image = UIImage.init(named: imageName)
            animationImages.append(image!)
        }
        view.animationImages = animationImages
        view.startAnimating()
        
        PKHUD.sharedHUD.contentView = view
        PKHUD.sharedHUD.show(onView: nil)
    }
    
    
}
