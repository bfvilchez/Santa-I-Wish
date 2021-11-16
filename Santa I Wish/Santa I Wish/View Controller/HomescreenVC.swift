//
//  HomescreenVC.swift
//  Santa I Wish
//
//  Created by Brian Vilchez on 10/29/21.
//

import Foundation
import UIKit

class HomescreenVC: UIViewController {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationController?.navigationBar.isHidden = true
    }
    
}

extension HomescreenVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChildCell", for: indexPath)
        
        return cell
    }
}
