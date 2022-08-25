//
//  PRDetailCell.swift
//  PullRequest
//
//  Created by heena thapar on 25/08/22.
//

import UIKit

class PRDetailCell: UITableViewCell {

    @IBOutlet weak var lblPRName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var lblClosedAt: UILabel!
    @IBOutlet weak var lblCreatedAt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImageView.layer.cornerRadius =  userImageView.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(data: PullRequest) {
        lblPRName.text = data.title ?? ""
        lblUserName.text = data.user?.login ?? ""
        lblCreatedAt.text = "Created At : \(data.created_at?.convertDate() ?? "")"
        lblClosedAt.text  = "Closed At  : \(data.closed_at?.convertDate() ?? "")"
        if let url = URL(string: data.user?.avatar_url ?? "") {
            if let data = try? Data(contentsOf: url) {
                userImageView.image = UIImage(data: data)
            }
        }
    }

}
