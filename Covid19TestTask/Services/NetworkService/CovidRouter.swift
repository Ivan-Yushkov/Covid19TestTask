//
//  CovidRouter.swift
//  Covid19TestTask
//
//  Created by Иван Юшков on 07.01.2021.
//

import Foundation
import Alamofire

class Covid {
    static let summaryPath = "https://api.covid19api.com/summary"
}

public enum CovidRouter: URLRequestConvertible {
   
    case getSummaryData([String: Any])
    
    public func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .getSummaryData:
                return .get
            }
        }
        let params: ([String: Any]?) = {
            switch self {
            case .getSummaryData(let json):
                return json
            }
        }()
        let url: URL = {
            let url = URL(string: Covid.summaryPath)!
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return try encoding.encode(urlRequest, with: nil)
//        return try encoding.encode(urlRequest, with: params)
    }
}
