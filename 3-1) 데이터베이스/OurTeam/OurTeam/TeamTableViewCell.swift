//
//  TeamTableViewCell.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/03/21.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var teamCellUIView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        teamCellUIView.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
