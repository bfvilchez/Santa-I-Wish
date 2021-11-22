//
//  ChildProfileVC.swift
//  Santa I Wish
//
//  Created by Brian Vilchez on 10/29/21.
//

import Foundation
import UIKit

class childProfileVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var profileImage: ProfileImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var labels = ["Wish List", "letters"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        profileImage.borderColor = UIColor.red.cgColor
        navigationController?.navigationBar.isHidden = false
    }
    
    
}

extension childProfileVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeCell", for: indexPath) as? WishListAndLettersCellCollectionViewCell else {
          return  UICollectionViewCell() }
        
        cell.nameLabel.text = labels[indexPath.row]
        cell.layer.cornerRadius = 30
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedLabel = labels[indexPath.row]
        
        if selectedLabel == labels.last {
            performSegue(withIdentifier: "lettersSegue", sender: nil)
        } else {
            performSegue(withIdentifier: "wishListSegue", sender: nil)
        }
    }
}
