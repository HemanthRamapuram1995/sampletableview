//
//  PRItemCell.swift
//  PullRequestSampleApp
//
//  Created by Hemanth Ramapuram on 17/12/21.
//

import UIKit

class PRItemCell: UITableViewCell {

    @IBOutlet var lblTitle : UILabel!
    @IBOutlet var lblClosedDate : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.accessoryType = .disclosureIndicator
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data : PullsList.ResponseModel){
        print("\(data.strTitle!) \n \(data.closedDate!)")
        lblTitle.text = data.strTitle
        lblClosedDate.text =  data.closedDate
    }

}
