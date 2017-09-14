//
//  UIColor+Extension.swift
//  Vankeyi-Swift
//
//  Created by SimonYHB on 2016/12/8.
//  Copyright © 2016年 yhb. All rights reserved.
//

import UIKit

extension UIColor{
    static let backgroundColor = UIColor.init(hexString: "f2f7f7")!
    static let globalColor = UIColor.init(hexString: "ec6b39")!
    
    class func setGradualChangingColor(view:UIView, fromColor:String, toColor:String) -> CAGradientLayer {
        let layer = CAGradientLayer.init()
        layer.frame = view.bounds
        layer.colors = [UIColor.init(hexString: fromColor)!.cgColor, UIColor.init(hexString: toColor)!.cgColor]
        layer.startPoint = CGPoint.init(x: 0, y: 0)
        layer.endPoint = CGPoint.init(x: 1, y: 0)
        return layer
    }
}
