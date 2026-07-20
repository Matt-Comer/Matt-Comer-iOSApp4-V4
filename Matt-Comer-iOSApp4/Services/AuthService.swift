//
//  AuthService.swift
//  Matt-Comer-iOSApp4
//
//  Created by matthew comer on 2026-07-18.
//

import Foundation
import FirebaseAuth

// Handles Firebase authentication for ForgeFlow.
class AuthService {
    // Creates one shared authentication service.
    static let shared=AuthService()
    // Prevents additional authentication services from being created.
    private init() {
    }
    // Returns the currently signed-in Firebase user.
    var currentUser:User? {
        Auth.auth().currentUser
    }
    // Creates a new Firebase user account.
    func signUp(
        email:String,
        password:String,
        completion:@escaping(Result<User,Error>)->Void
    ) {
        Auth.auth().createUser(
            withEmail:email,
            password:password
        ) { result,error in
            // Returns the Firebase registration error.
            if let error=error {
                completion(.failure(error))
                return
            }
            // Returns the newly created Firebase user.
            guard let user=result?.user else {
                completion(
                    .failure(
                        NSError(
                            domain:"AuthService",
                            code:-1,
                            userInfo:[
                                NSLocalizedDescriptionKey:"User account could not be created"
                            ]
                        )
                    )
                )
                return
            }
            completion(.success(user))
        }
    }
    // Signs in an existing Firebase user.
    func signIn(
        email:String,
        password:String,
        completion:@escaping(Result<User,Error>)->Void
    ) {
        Auth.auth().signIn(
            withEmail:email,
            password:password
        ) { result,error in
            // Returns the Firebase login error.
            if let error=error {
                completion(.failure(error))
                return
            }
            // Returns the signed-in Firebase user.
            guard let user=result?.user else {
                completion(
                    .failure(
                        NSError(
                            domain:"AuthService",
                            code:-1,
                            userInfo:[
                                NSLocalizedDescriptionKey:"User could not be signed in"
                            ]
                        )
                    )
                )
                return
            }
            completion(.success(user))
        }
    }
    // Signs out the current Firebase user.
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Sign Out Error:",error.localizedDescription)
        }
    }
}
