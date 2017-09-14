//
//  UIImage+Extension.swift
//  Vankeyi-Swift
//
//  Created by SimonYHB on 2017/2/23.
//  Copyright © 2017年 yhb. All rights reserved.
//

import Foundation
import UIKit
extension UIImage{
    static func createImageWithColor(color: UIColor) -> UIImage?
    {
        let rect = CGRect(x: 0.0, y: 0.0, w: 1.0, h: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage
    }
    static func getScreenShot() -> UIImage {
        let window = UIApplication.shared.keyWindow
        UIGraphicsBeginImageContextWithOptions((window?.bounds.size)!, true, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        window?.layer.render(in: context!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
