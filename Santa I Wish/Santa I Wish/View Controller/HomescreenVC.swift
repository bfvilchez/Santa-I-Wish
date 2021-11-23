//
//  HomescreenVC.swift
//  Santa I Wish
//
//  Created by Brian Vilchez on 10/29/21.
//

import Foundation
import UIKit
import CoreData

class HomescreenVC: UIViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var childParent: Parent?
    
    var fetchResultsController: NSFetchedResultsController<Child> {
        
        let fetchRequest: NSFetchRequest<Child> = Child.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let moc = CoreDataStack.shared.mainContext
        
        let fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchResultsController.delegate = self
        
        do {
            try fetchResultsController.performFetch()
        } catch {
            fatalError("Failed to fetch entities: \(error)")
        }
        return fetchResultsController
    }
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "childSegue" {
            guard let destinationVC = segue.destination as? childProfileVC else { return }
            
            if let sender = sender as? ChildCell {
                guard let index = collectionView.indexPath(for: sender) else { return }
                destinationVC.child = fetchResultsController.object(at: index)
            }
            
        } else if segue.identifier == "SettingsSegue" {
            let destinationVC = segue.destination as? SettingsVC
            //TODO: - finishing passing model controller
        }
    }
}

extension HomescreenVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResultsController.fetchedObjects?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChildCell", for: indexPath) as? ChildCell else {
            return  UICollectionViewCell() }
        cell.childNameLabel.text = fetchResultsController.object(at: indexPath).name
        cell.layer.cornerRadius = 30
        return cell
    }
}
