//
//  NetworkManager.swift
//  PullRequestSampleApp
//
//  Created by Hemanth Ramapuram on 17/12/21.
//

import Foundation
import UIKit

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
    
    func fetchImageData(strImageURL : String? ,
                        completionHandler : @escaping((UIImage?)->Void)){
        guard let strImageURL = strImageURL,
              let objImgURL = URL(string: strImageURL) else {
                  completionHandler(UIImage(named: "placeholder"))
                  return
              }
        URLSession.shared.dataTask(with: objImgURL, completionHandler: { data , response , error in
            guard error == nil ,
                  let data = data  ,
                  let image = UIImage(data: data) else{
                      completionHandler(UIImage(named: "placeholder"))
                      return
                  }
            completionHandler(image)
        }).resume()
    }
    
}
