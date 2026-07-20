//
//  RegisterView.swift
//  Matt-Comer-iOSApp4
//
//  Created by matthew comer on 2026-07-18.
//

import SwiftUI

// Displays the ForgeFlow account registration screen.
struct RegisterView:View {
    // Stores the email entered by the user.
    @State private var email=""
    // Stores the password entered by the user.
    @State private var password=""
    // Stores the confirmed password entered by the user.
    @State private var confirmPassword=""
    // Stores the validation error message.
    @State private var errorMessage=""
    // Controls whether the error alert is displayed.
    @State private var showError=false
    var body:some View {
        // Creates the main registration screen.
        ZStack {
            // Displays the ForgeFlow black background.
            Color.black
                .ignoresSafeArea()
            // Organizes the registration form vertically.
            VStack(spacing:23) {
                Spacer()
                // Displays the registration title.
                Text("Create Account")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(.purple)
                // Allows the user to enter an email address.
                TextField("Email",text:$email)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .padding()
                    .background(.white.opacity(0.10))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius:13))
                // Allows the user to enter a password.
                SecureField("Password",text:$password)
                    .padding()
                    .background(.white.opacity(0.10))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius:13))
                // Allows the user to confirm the password.
                SecureField("Confirm Password",text:$confirmPassword)
                    .padding()
                    .background(.white.opacity(0.10))
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius:13))
                // Creates a new ForgeFlow account.
                Button {
                    register()
                } label: {
                    Text("Register")
                        .fontWeight(.semibold)
                        .frame(maxWidth:.infinity,minHeight:50,maxHeight:50)
                        .foregroundStyle(.black)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius:13))
                }
                Spacer()
            }
            .padding()
        }
        // Displays registration validation errors.
        .alert("Register Error",isPresented:$showError) {
            Button("OK") {
            }
        } message: {
            Text(errorMessage)
        }
    }
    // Validates the information and creates a Firebase account.
    private func register() {
        // Stops registration when the email is empty.
        guard !email.isEmpty else {
            errorMessage="Please enter your email"
            showError=true
            return
        }
        // Stops registration when the password is empty.
        guard !password.isEmpty else {
            errorMessage="Please enter your password"
            showError=true
            return
        }
        // Stops registration when the confirmed password is empty.
        guard !confirmPassword.isEmpty else {
            errorMessage="Please confirm your password"
            showError=true
            return
        }
        // Stops registration when the passwords do not match.
        guard password==confirmPassword else {
            errorMessage="Passwords do not match"
            showError=true
            return
        }
        // Sends the registration information through Firebase.
        AuthService.shared.signUp(
            email:email,
            password:password
        ) { result in
            DispatchQueue.main.async {
                switch result {
                // Confirms that the account was created.
                case .success:
                    print("Account created successfully")
                // Displays the Firebase registration error.
                case .failure(let error):
                    errorMessage=error.localizedDescription
                    showError=true
                }
            }
        }
    }
}
