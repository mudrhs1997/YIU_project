//
//  TeamTableViewCell.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/03/21.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var teamCellUIView: UIView!
    @IBOutlet weak var teamImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        teamCellUIView.layer.cornerRadius = 20
        
        teamImage.layer.cornerRadius = teamImage.bounds.width / 2
        
        makeShadow()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func makeShadow() {
        teamCellUIView.layer.shadowColor = UIColor.black.cgColor
        teamCellUIView.layer.shadowOpacity = 0.3
        teamCellUIView.layer.shadowRadius = 3
        teamCellUIView.layer.shadowOffset = CGSize(width: 0, height: 0)
        teamCellUIView.layer.shadowPath = nil
    }
    
}
