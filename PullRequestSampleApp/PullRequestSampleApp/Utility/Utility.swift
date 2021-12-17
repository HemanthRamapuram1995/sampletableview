//
//  Utility.swift
//  PullRequestSampleApp
//
//  Created by Hemanth Ramapuram on 17/12/21.
//

import Foundation
import UIKit

enum StoryBoardName : String {
    case Main
    func getViewController<T : UIViewController>(type : T.Type) -> T{
        guard let vc = UIStoryboard(name: self.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: type)) as? T else{
            fatalError("register view contoller with storyboard ID same as ViewController Name")
        }
        return vc
    }

}

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

