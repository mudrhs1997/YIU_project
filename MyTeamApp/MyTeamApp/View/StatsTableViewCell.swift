//
//  StatsTableViewCell.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/15.
//

import UIKit

class StatsTableViewCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let gamesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let winsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let drawsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let losesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let goalsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let assistsLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setLayout() {
        
    }

}
