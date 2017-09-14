//
//  VKYValiatedPhoneProtocol.swift
//  Vankeyi-Swift
//
//  Created by SimonYHB on 2017/1/11.
//  Copyright © 2017年 yhb. All rights reserved.
//

import Foundation

protocol VKYValiatedPhoneProtocol: NSObjectProtocol {
    func isValiatedPhone(phone: String?) -> Bool
    func isValiatedEmail(email: String?) -> Bool

}
extension VKYValiatedPhoneProtocol {
    func isValiatedPhone(phone: String?) -> Bool {
//        "^1[3-9]\\d{9}$"
//        "^((1[3,5,8][0-9])|(14[5,7])|(17[0-9]))\\d{8}$"
//        let mobile = "^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$"
        let mobile = "^1[3-9]\\d{9}$"
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        return regextestmobile.evaluate(with: phone)
    }
    func isValiatedEmail(email: String?) -> Bool {
        
        let emailZZ = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z0-9]{2,4}"
        let regextestemail = NSPredicate.init(format: "SELF MATCHES %@", emailZZ)
        return regextestemail.evaluate(with: email)
    }
}
