//
//  RecordViewController.swift
//  OurTeam
//
//  Created by 정명곤 on 2022/04/18.
//

import UIKit

class RecordViewController: UIViewController {

    @IBOutlet weak var recordCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        recordCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        recordCollectionView.dataSource = self
        recordCollectionView.delegate = self
        

    }
    

    

}

extension RecordViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecordTabBarCollectionViewCell", for: indexPath)
        

       
        
        return cell
    }
    
    
}
