//
//  ViewController.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var popupButton: UIButton!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var teamTableView: UITableView! {
        didSet {
            teamTableView.delegate = self
            teamTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainLabel.text = "My Team"
        
        teamTableView.register(UINib(nibName: "TeamTableViewCell", bundle: nil), forCellReuseIdentifier: "teamCell")
        
        teamTableView.layer.cornerRadius = 20
        teamTableView.separatorStyle = .none
        
        popupButton.layer.cornerRadius = popupButton.bounds.size.width / 2

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let teamCell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        
        teamCell.selectionStyle = .none
        
        
        
        
        return teamCell
    }

}

