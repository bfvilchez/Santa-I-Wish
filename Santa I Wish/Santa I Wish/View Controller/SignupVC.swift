//
//  SignupVC.swift
//  Santa I Wish
//
//  Created by Brian Vilchez on 10/29/21.
//

import Foundation
import UIKit

class SignupVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Properties
    private let firebase = FirebaseManagerAPI()
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func continueButtonPressed(_ sender: UIButton) {
    }
    
    // MARK: - Methods
    private func registerAccount() {
        
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
        let name = fullNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
            
        if isPasswordValid(password) {
            firebase.registerAccount(withEmail: email, password: password) { Result in
                
            }
        }
    }
    
    private func isPasswordValid(_ password: String) -> Bool {
        // 1 - Password length is 8.
        // 2 - One Alphabet in Password.
        // 3 - One Special Character in Password.
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
