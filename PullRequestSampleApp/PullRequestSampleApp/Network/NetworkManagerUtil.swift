//
//  NetworkManagerUtil.swift
//  PullRequestSampleApp
//
//  Created by Hemanth Ramapuram on 17/12/21.
//

import Foundation


protocol QueryParms{
    var getQueryParms : [URLQueryItem] {get}
}


protocol APIRequest {
    var scheme : APIScheme {get}
    var method : APIMethod {get}
    var host : APIHost {get}
    var path : String {get}
}

enum APIScheme : String{
    case https
}

enum APIHost : String {
    case github = "api.github.com"
}

enum APIMethod : String {
    case post
    case get
}

enum PRStatus : String , Codable {
    case closed
    case all
    case open
}

enum APICall : APIRequest {
    var path: String{
        switch self {
        case .getPullRequests(let owner , let repo):
            return "/repos/\(owner)/\(repo)/pulls"
        }
    }
    
    var scheme: APIScheme {
        switch self {
        default:
            return .https
        }
    }
    
    var method: APIMethod {
        switch self {
        case .getPullRequests(_,_):
            return .get
        }
    }
    
    var host: APIHost {
        switch self {
        case .getPullRequests(_,_):
            return .github
        }
    }
    
    case getPullRequests(owner : String , repo : String)
    
    var objUrl : URLComponents?{
        var components = URLComponents()
        components.scheme = self.scheme.rawValue
        components.path = self.path
        components.host = self.host.rawValue
        return components
    }
    
}
