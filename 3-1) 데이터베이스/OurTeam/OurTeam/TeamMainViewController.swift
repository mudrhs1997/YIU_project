//
//  TeamMainViewController.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/03/23.
//

import UIKit

class TeamMainViewController: UIViewController {
    
    
    @IBOutlet weak var teamBox: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        teamBox.layer.cornerRadius = 10
        teamBox.layer.shadowColor = UIColor.black.cgColor
        teamBox.layer.shadowOpacity = 0.1
        teamBox.layer.shadowRadius = 3
        teamBox.layer.shadowOffset = CGSize(width: 0, height: 0)
        teamBox.layer.shadowPath = nil
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func makeButton() {
        
    }

    @IBAction func recordButton(_ sender: Any) {
        
    }
    
}
