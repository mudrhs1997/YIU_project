//
//  RecordTabBarCollectionViewCell.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/04/18.
//

import UIKit

class RecordTabBarCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = .blue
        self.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        
        let image = UIImageView()
        
        image.backgroundColor = .black
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }

}
