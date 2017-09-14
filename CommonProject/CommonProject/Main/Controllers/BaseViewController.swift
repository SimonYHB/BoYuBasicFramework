//
//  BaseViewController.swift
//  WorkSpace
//
//  Created by 生生 on 2017/8/10.
//  Copyright © 2017年 生生. All rights reserved.
//

import UIKit
import ObjectMapper
import RxSwift
class AKTestModel: Mappable {
    var identifier: Int!
    // MARK: JSON
    required init?(map: Map) { }
    func mapping(map: Map) {
        identifier <- map["identifier"]

    }
}
enum Direction : String {
    case left, right
}
class BaseViewController: UIViewController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge()
        self.automaticallyAdjustsScrollViewInsets = false
        navigationItem.hidesBackButton = true
        //判断返回按钮是dismiss还是Pop
        if  navigationController != nil && (navigationController?.childViewControllers.count)! > 1 {
            addBackItem()
        } else {
            addPresentBackItem()
        }

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if  navigationController != nil && (navigationController?.childViewControllers.count)! > 1{
            //滑动返回
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if  navigationController != nil && (navigationController?.childViewControllers.count)! > 1 {
            self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        }
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension BaseViewController
{
    //设置透明导航栏
    open func setClarityNavigationBar() {
        // 1、设置导航栏标题属性：设置标题颜色
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        // 2、设置导航栏前景色：设置item指示色
        navigationController?.navigationBar.tintColor = UIColor.white
        
        // 3、设置导航栏半透明
        navigationController?.navigationBar.isTranslucent = true
        
        // 4、设置导航栏背景图片
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        // 5、设置导航栏阴影图片
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    //配置导航栏
    open func setNavigationBar(textColor: UIColor, tintColor: UIColor, backgroundColor: UIColor? = nil) {
        self.navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:textColor]
        navigationController?.navigationBar.tintColor = tintColor
        if backgroundColor == nil {
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        } else {
            navigationController?.navigationBar.setBackgroundImage(UIImage.createImageWithColor(color: backgroundColor!), for: .default)
        }
    }
    //#FIXME: 使用前需更换返回按钮的图片
    //添加dismiss按钮
    fileprivate func addPresentBackItem() {
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, w: 44, h: 44))
        backButton.setImage(UIImage(named: "icon_return"), for: .normal)
        
        let nagetiveSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        nagetiveSpacer.width = -10 * SCALE_WIDTH
        let backItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "icon_return"), style: .plain, target: self, action: #selector(dismissViewController))
        self.navigationItem.leftBarButtonItems = [nagetiveSpacer, backItem]
    }
    @objc private func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //添加返回按钮
    fileprivate func addBackItem() {
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, w: 44, h: 44))
        backButton.setImage(UIImage(named: "icon_return"), for: .normal)
        
        let nagetiveSpacer = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        nagetiveSpacer.width = -10 * SCALE_WIDTH
        let backItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "icon_return"), style: .plain, target: self, action: #selector(popViewController))
        self.navigationItem.leftBarButtonItems = [nagetiveSpacer, backItem]
        //
        if (navigationController?.childViewControllers.count)! > 2 {
            let closeItem = UIBarButtonItem.init(image: #imageLiteral(resourceName: "city_guanbi"), style: .plain, target: self, action: #selector(closeVC))
            
            self.navigationItem.leftBarButtonItems?.append(closeItem)
        }
        
    }
    @objc private func popViewController() {
//        SVProgressHUD.dismiss()
        _ = navigationController?.popViewController(animated: true)
    }
    @objc private func closeVC() {
//        SVProgressHUD.dismiss()
        _ = self.navigationController?.popToRootViewController(animated: true)
    }
    

}



