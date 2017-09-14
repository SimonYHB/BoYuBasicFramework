//
//  BasicRxMoyaProvider.swift
//  CommonProject
//
//  Created by SimonYHB on 2017/9/7.
//  Copyright © 2017年 yhb. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import Alamofire

class BasicRxMoyaProvider<Target>: RxMoyaProvider<Target> where Target: TargetType {
    
    override public init(endpointClosure: @escaping EndpointClosure = BasicRxMoyaProvider.endpointMapping,
                         requestClosure: @escaping RequestClosure = MoyaProvider.defaultRequestMapping,
                         stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
                         manager: Manager = BasicRxMoyaProvider.defaultAlamofireManager(),
                         plugins: [PluginType] = [],
                         trackInflights: Bool = false) {
        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, manager: manager, plugins: plugins, trackInflights: trackInflights)
    }
}

extension BasicRxMoyaProvider {
    class func endpointMapping<Target: TargetType>(target: Target) -> Endpoint<Target> {
        print("请求连接：\(target.baseURL)\(target.path) \n方法：\(target.method)\n参数：\(String(describing: target.parameters)) ")
        return MoyaProvider.defaultEndpointMapping(for: target)
    }
    
    class func alamofireManager() -> Manager {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        let policies: [String: ServerTrustPolicy] = [
            
            "ap.grtstar.cn": .disableEvaluation
        ]
        let manager = Alamofire.SessionManager(configuration: configuration,serverTrustPolicyManager: ServerTrustPolicyManager(policies: policies))
        
        manager.startRequestsImmediately = false
        return manager
    }
}
