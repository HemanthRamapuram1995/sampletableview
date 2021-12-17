//
//  PullRequestListVM.swift
//  PullRequestSampleApp
//
//  Created by Hemanth Ramapuram on 17/12/21.
//

import Foundation

protocol PullListVMDelegate : AnyObject {
    func fetchDataFailed(reason : String)
    func fetchDataSuccesful(data : [PullsList.ResponseModel])
    func dataUnavailable()
}

enum PullRequestErrors : Error {
    case invalidOwenr
    case invalidRepo
}

class PullRequestListVM{
    
    var owner : String?
    var repository : String?
    
    private let networkManager = NetworkManager()
    weak var delegate : PullListVMDelegate?
    
    init(){
        
    }
    
    private func fetchedListData(data : Data? , status : Int , error : Error? ){
        guard status == 200 else {
            var strErrorMessage = "Please try Again"
            if let strMsg = error?.localizedDescription , !strMsg.isEmpty {
                strErrorMessage = strMsg
            }
            delegate?.fetchDataFailed(reason: strErrorMessage)
            return
        }
        do{
            guard let arrPR = try getData(from: data, type: [PullsList.ResponseModel].self) else{
                delegate?.fetchDataSuccesful(data: [])
                return
            }
            delegate?.fetchDataSuccesful(data: arrPR)
        }catch{
            delegate?.dataUnavailable()
        }
        
    }
    
    
    
    func fetchPullRequestsList(_ state : PRStatus = .all) throws {
        guard let owner = owner  else {
            throw PullRequestErrors.invalidOwenr
        }
        guard let repository = repository else {
            throw PullRequestErrors.invalidRepo
        }
        networkManager.makeCall(.getPullRequests(owner: owner, repo: repository),
                                queryParms: PullsList.Request(state: state)){[weak self] (objResponse , status , error ) in
            
            self?.fetchedListData(data: objResponse, status: status, error: error)
        }
        
        
    }
    
}
