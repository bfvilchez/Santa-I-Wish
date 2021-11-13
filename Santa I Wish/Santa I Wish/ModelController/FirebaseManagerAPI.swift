//
//  FirebaseManagerAPI.swift
//  Santa I Wish
//
//  Created by Brian Vilchez on 11/3/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class FirebaseManagerAPI {
    
    var alertVC: UIAlertController?
    private let firestoreDB = Firestore.firestore()
    
    func registerAccount(withEmail email: String, password: String, fullName: String, completion: @escaping(Result<String,Error>) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { _, networkError in
            if let error = networkError {
                completion(.failure(error))
            }
        }
    }
    
    func isEmailValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let isEmailValid = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return isEmailValid.evaluate(with: email)
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        // 1 - Password length is 8.
        // 2 - One Alphabet in Password.
        // 3 - One Special Character in Password.
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    func showAccountErrorAlert(errorMessage: String) {
        let alert = UIAlertController(title: "Oops!", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.alertVC = alert
    }
    
    enum NetworkErrorType: Error {
        case errorCreatingAccount
    }
}
