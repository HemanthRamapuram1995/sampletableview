//
//  PullRequestDetailViewController.swift
//  PullRequestSampleApp
//
//  Created by Hemanth Ramapuram on 17/12/21.
//

import UIKit

class PullRequestDetailViewController: UIViewController {
    
    
    @IBOutlet var lblTitle : UILabel!
    @IBOutlet var lblCreated : UILabel!
    @IBOutlet var lblClosed : UILabel!
    @IBOutlet var lblUserName : UILabel!
    @IBOutlet var avatarImgView : UIImageView!
    
    var data : PullsList.ResponseModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
        guard let data = data else {
            self.navigationController?.popViewController(animated: true)
            return
        }
        self.lblTitle.text = data.strTitle
        self.lblUserName.text = data.userName
        if let closedDate = data.closedDate{
            self.lblClosed.text = "Closed at : \(closedDate)"
        }
        if let createdDate = data.createdDate{
            self.lblCreated.text = "Created at : \(createdDate)"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpUI()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
