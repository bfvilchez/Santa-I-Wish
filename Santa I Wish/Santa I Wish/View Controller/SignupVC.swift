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
    private let firebaseAPI = FirebaseManagerAPI()
    
    // MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        registerAccount()
    }
    
    // MARK: - Methods
    private func registerAccount() {
        
        guard let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !password.isEmpty, let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !email.isEmpty, let name = fullNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !name.isEmpty else {
            firebaseAPI.showAccountErrorAlert(errorMessage: "Please fill out all fields")
            self.present(firebaseAPI.alertVC!, animated: true, completion: nil)
            return
        }
            
        if firebaseAPI.isPasswordValid(password) && firebaseAPI.isEmailValid(email: email) {
            firebaseAPI.registerAccount(withEmail: email, password: password, fullName: name) { result in
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "ShowHomeSegue", sender: nil)
                }
            }
        } else {
            firebaseAPI.showAccountErrorAlert(errorMessage: "Please insert valid credentials")
            self.present(firebaseAPI.alertVC!, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHomeSegue" {
            let destinationVC = segue.destination as? HomescreenVC
            destinationVC?.childParent = firebaseAPI.parent
        }
    }
}

