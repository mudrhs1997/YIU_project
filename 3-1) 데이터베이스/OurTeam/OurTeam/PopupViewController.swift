//
//  PopupViewController.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/03/22.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var popupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popupButton.layer.cornerRadius = popupButton.bounds.size.width / 2
    }
    
    
    @IBAction func dismissPopup(_ sender: Any) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            
            
            //  꼭 해야 화면이 갱신됨 ( 지정된 시간만큼 )
            self.view.layoutIfNeeded()
            
        } completion: { completion in
            //  애니메이션 끝나는 시점.
            
            self.dismiss(animated: false, completion: nil)
            
        }
    }
}
