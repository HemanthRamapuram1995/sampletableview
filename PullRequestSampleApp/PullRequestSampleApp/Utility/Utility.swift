//
//  Utility.swift
//  PullRequestSampleApp
//
//  Created by Hemanth Ramapuram on 17/12/21.
//

import Foundation

func getData<T : Decodable>(from data : Data? , type : T.Type) throws -> T?{
    guard let data = data else {
        return nil
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    }catch let e {
        throw e
    }
}
