//
//  TeamMainViewController.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/03/23.
//

import UIKit

class TeamMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        makeButton()
        // Do any additional setup after loading the view.
    }
    
    func makeButton() {
        
    }

    
    @IBAction func showNotice(_ sender: Any) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "NoticeViewController") else {
            return
        }
        
        self.navigationController?.pushViewController(pushVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainCell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        
        mainCell.selectionStyle = .none
        
        
        
        
        return mainCell
    }

}
