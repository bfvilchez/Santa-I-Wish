//
//  SettingsVC.swift
//  Santa I Wish
//
//  Created by Brian Vilchez on 11/22/21.
//

import UIKit

class SettingsVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        navigationController?.navigationBar.isHidden = false
        self.title = ""
    }
}
