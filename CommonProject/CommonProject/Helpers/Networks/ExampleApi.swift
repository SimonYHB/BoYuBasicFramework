//
//  ExampleApi.swift
//  CommonProject
//
//  Created by SimonYHB on 2017/9/7.
//  Copyright © 2017年 yhb. All rights reserved.
//

//        //网络框架的模拟使用
//        BasicRxMoyaProvider<ExampleApi>.init().request(.userRepositories("eqeq")).mapArray(AKTestModel.self).subscribe { (event) in
//            switch event {
//            case .next(let element):
//                print(element)
//            case .error(let error):
//                print(error)
//            default:
//                break
//            }
//        }.addDisposableTo(DisposeBag.init())

import Foundation
import Moya

private extension String {
    //处理异常字符,若path只用固定字符串则不需要
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

public enum ExampleApi {
    case zen
    case userProfile(String)
    case userRepositories(String)
}

extension ExampleApi: TargetType {
    public var baseURL: URL { return URL(string: "https://api.github.com")! }
    public var path: String {
        switch self {
        case .zen:
            return "/zen"
        case .userProfile(let name):
            return "/users/\(name.urlEscaped)"
        case .userRepositories(let name):
            return "/users/\(name.urlEscaped)/repos"
        }
    }
    public var method: Moya.Method {
        return .get
    }
    public var parameters: [String: Any]? {
        switch self {
        case .userRepositories(_):
            return ["sort": "pushed"]
        default:
            return nil
        }
    }
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    public var task: Task {
        return .request
    }
    public var validate: Bool {
        switch self {
        case .zen:
            return true
        default:
            return false
        }
    }
    public var sampleData: Data {
        switch self {
        case .zen:
            return "Half measures are as bad as nothing at all.".data(using: String.Encoding.utf8)!
        case .userProfile(let name):
            return "{\"login\": \"\(name)\", \"id\": 100}".data(using: String.Encoding.utf8)!
        case .userRepositories(_):
            return "[{\"name\": \"Repo Name\"}]".data(using: String.Encoding.utf8)!
        }
    }
    public var headers: [String: String]? {
        return nil
    }
}
