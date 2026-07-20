//
//  AuthViewModel.swift
//  Matt-Comer-iOSApp4
//
//  Created by matthew comer on 2026-07-18.
//

import Foundation
import FirebaseAuth
import Combine

// Controls the authentication state of ForgeFlow.
class AuthViewModel:ObservableObject {
    // Stores the currently signed-in Firebase user.
    @Published var user:User?
    // Tracks whether a user is logged in.
    @Published var isLoggedIn=false
    // Stores the Firebase authentication listener.
    private var authListener:AuthStateDidChangeListenerHandle?
    // Starts listening for Firebase authentication changes.
    init() {
        authListener=Auth.auth().addStateDidChangeListener { auth,user in
            DispatchQueue.main.async {
                self.user=user
                self.isLoggedIn=user != nil
            }
        }
    }
    // Signs in an existing Firebase user.
    func signIn(email:String,password:String) {
        AuthService.shared.signIn(
            email:email,
            password:password
        ) { result in
            switch result {
            case .success:
                print("User signed in successfully")
            case .failure(let error):
                print("Sign In Error:",error.localizedDescription)
            }
        }
    }
    // Creates a new Firebase user account.
    func signUp(email:String,password:String) {
        AuthService.shared.signUp(
            email:email,
            password:password
        ) { result in
            switch result {
            case .success:
                print("Account created successfully")
            case .failure(let error):
                print("Sign Up Error:",error.localizedDescription)
            }
        }
    }
    // Signs out the current Firebase user.
    func signOut() {
        AuthService.shared.signOut()
    }
    // Removes the Firebase authentication listener.
    deinit {
        if let authListener=authListener {
            Auth.auth().removeStateDidChangeListener(authListener)
        }
    }
}
