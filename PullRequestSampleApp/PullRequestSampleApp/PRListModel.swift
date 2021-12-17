//
//  PRListModel.swift
//  PullRequestSampleApp
//
//  Created by Hemanth Ramapuram on 17/12/21.
//

import Foundation

enum PullsList{
    
    struct Request : QueryParms {
        let state : PRStatus
        var getQueryParms: [URLQueryItem]{
            return [URLQueryItem(name: "state", value: state.rawValue)]
        }
        
    }
    
    struct ResponseModel : Decodable {
        let strTitle : String?
        let createdDate : String?
        let closedDate : String?
        let strUserImage : String?
        let userName : String?
        
        enum CodingKeys : String , CodingKey{
            case title
            case user
            case created_at
            case closed_at
            case login , avatar_url
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            strTitle = try? container.decodeIfPresent(String.self, forKey: .title)
            createdDate = try? container.decodeIfPresent(String.self, forKey: .created_at)
            closedDate = try? container.decodeIfPresent(String.self, forKey: .closed_at)
            let user = try? container.nestedContainer(keyedBy: CodingKeys.self, forKey: .user)
            userName = try? user?.decodeIfPresent(String.self, forKey: .login)
            strUserImage = try? user?.decodeIfPresent(String.self, forKey: .avatar_url)
        }
        
    }
    
}
