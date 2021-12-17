//
//  NetworkManager.swift
//  PullRequestSampleApp
//
//  Created by Hemanth Ramapuram on 17/12/21.
//

import Foundation

class NetworkManager {
    func makeCall(_ taret : APICall ,
                  queryParms : QueryParms? = nil ,
                  body : Encodable? = nil,
                  callback : @escaping(((data  :  Data? , statusCode : Int ,  error : Error?)) -> Void)){
        
        guard var componnets = taret.objUrl else{
            return
        }
        if let queryItems = queryParms?.getQueryParms{
            componnets.queryItems = queryItems
        }
        var objRequest = URLRequest(url: componnets.url!)
        objRequest.httpMethod = taret.method.rawValue
        URLSession.shared.dataTask(with: objRequest, completionHandler: { data , response , error in
            callback((data , (response as! HTTPURLResponse).statusCode , error ))
        }).resume()
        
    }
    
}
