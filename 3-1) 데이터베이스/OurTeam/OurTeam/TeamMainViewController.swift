//
//  TeamMainViewController.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/03/23.
//

import UIKit

class TeamMainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "?"
        // Do any additional setup after loading the view.
    }

    
    @IBAction func showNotice(_ sender: Any) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "NoticeViewController") else {
            return
        }
        
        self.navigationController?.pushViewController(pushVC, animated: true)
        
    }

}
