//
//  TeamMainViewController.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/03/23.
//

import UIKit

class TeamMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var teamBox: UIView!
    

    @IBOutlet weak var mainTableView: UITableView! {
        didSet {
            mainTableView.delegate = self
            mainTableView.dataSource = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        teamBox.layer.cornerRadius = 10
        teamBox.layer.shadowColor = UIColor.black.cgColor
        teamBox.layer.shadowOpacity = 0.1
        teamBox.layer.shadowRadius = 3
        teamBox.layer.shadowOffset = CGSize(width: 0, height: 0)
        teamBox.layer.shadowPath = nil
        
        mainTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "mainCell")
        
        // Do any additional setup after loading the view.
    }
    
    func makeButton() {
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainCell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
        
        mainCell.selectionStyle = .none
        
        
        
        
        return mainCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teamViewController = self.storyboard?.instantiateViewController(withIdentifier: "NoticeViewController")
        
        self.navigationController?.pushViewController(teamViewController!, animated: true)
    }

}
