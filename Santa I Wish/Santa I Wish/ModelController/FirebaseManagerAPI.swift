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
    
    func registerAccount(withEmail email: String, password: String, completion: @escaping(Result<String,Error>) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { _, networkError in
            if let error = networkError {
                completion(.failure(error))
            }
        }
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
