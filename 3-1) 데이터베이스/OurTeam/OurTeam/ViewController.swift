//
//  ViewController.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileUIView: UIView!
    @IBOutlet weak var popupButton: UIButton!
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var teamTableView: UITableView! {
        didSet {
            teamTableView.delegate = self
            teamTableView.dataSource = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainLabel.text = "My Team"
        
        teamTableView.register(UINib(nibName: "TeamTableViewCell", bundle: nil), forCellReuseIdentifier: "teamCell")
        
        teamTableView.layer.cornerRadius = 20
        teamTableView.separatorStyle = .none
        
        
        
        
        popupButton.layer.cornerRadius = popupButton.bounds.size.width / 2
        
        makeProfileView()

        
    }
    
    func makeProfileView() {
        profileImage.layer.cornerRadius = profileImage.bounds.size.width / 2
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let teamCell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        
        teamCell.selectionStyle = .none
        
        
        
        
        return teamCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teamViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
        teamViewController.modalPresentationStyle = .fullScreen
        
        self.present(teamViewController, animated: true, completion: nil)
    }

}

