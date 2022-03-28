//
//  TeamMainViewController.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/03/23.
//

import UIKit

class TeamMainViewController: UIViewController {

    @IBOutlet weak var scheduleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        makeButton()
        // Do any additional setup after loading the view.
    }
    
    func makeButton() {
        scheduleButton.layer.cornerRadius = 10
    }

    
    @IBAction func showNotice(_ sender: Any) {
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "NoticeViewController") else {
            return
        }
        
        self.navigationController?.pushViewController(pushVC, animated: true)
        
    }

}
