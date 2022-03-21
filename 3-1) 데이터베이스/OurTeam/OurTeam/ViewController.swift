//
//  ViewController.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var teamTableView: UITableView! {
        didSet {
            teamTableView.delegate = self
            teamTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        teamTableView.register(UINib(nibName: "TeamTableViewCell", bundle: nil), forCellReuseIdentifier: "teamCell")
        
        teamTableView.layer.cornerRadius = 20
        

        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let teamCell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        
        teamCell.selectionStyle = .none
        
        
        
        return teamCell
    }

}

