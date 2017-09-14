//
//  VKYReusableProtocol.swift
//  Vankeyi-Swift
//
//  Created by SimonYHB on 2017/1/9.
//  Copyright © 2017年 yhb. All rights reserved.
//

import Foundation
import UIKit
protocol VKYReusableProtocol: class {}
extension VKYReusableProtocol where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
